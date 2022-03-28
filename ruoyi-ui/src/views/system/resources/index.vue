<template>
	<div class="app-container">
		<el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
			<el-form-item label="文件名" prop="name">
				<el-input v-model="queryParams.name" placeholder="请输入文件名" clearable @keyup.enter.native="handleQuery" />
			</el-form-item>
			<el-form-item>
				<el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
				<el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
			</el-form-item>
		</el-form>
		<el-row :gutter="10" class="mb8">
			<el-col :span="1.5">
				<el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['system:resources:add']">上传</el-button>
			</el-col>
			<el-col :span="1.5">
				<el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate" v-hasPermi="['system:resources:edit']">修改</el-button>
			</el-col>
			<el-col :span="1.5">
				<el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['system:resources:remove']">删除</el-button>
			</el-col>
			<el-col :span="1.5">
				<el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport" v-hasPermi="['system:resources:export']">导出</el-button>
			</el-col>
			<right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
		</el-row>
		<el-table border v-loading="loading" :data="resourcesList" @selection-change="handleSelectionChange">
			<el-table-column type="selection" width="55" align="center" />
			<el-table-column label="文件id" align="center" prop="id" width="90px" />
			<el-table-column label="文件名" align="center" prop="name" />
			<el-table-column label="文件链接" align="center" prop="url" width="200px" />
			<el-table-column label="文件类型" align="center" prop="type" width="110px" />
			<el-table-column label="文件大小" align="center" prop="size" width="130px" />
			<el-table-column label="创建者" align="center" prop="createBy">
				<!-- <template slot-scope="scope">
          <dict-tag :options="dict.type.${column.dictType}" :value="scope.row.createBy"/>
        </template> -->
			</el-table-column>
			<el-table-column label="创建时间" align="center" prop="createTime" width="180">
				<!-- <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template> -->
			</el-table-column>
			<el-table-column label="更新者" align="center" prop="updateBy">
			</el-table-column>
			<el-table-column label="更新时间" align="center" prop="updateTime" width="180">
				<!-- <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d}') }}</span>
        </template> -->
			</el-table-column>
			<el-table-column label="操作" align="center" class-name="small-padding fixed-width">
				<template slot-scope="scope">
					<el-button size="mini" type="text" icon="el-icon-edit" @click="handleDownload(scope.row)">下载</el-button>
					<el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:resources:edit']">修改</el-button>
					<el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['system:resources:remove']">删除</el-button>
				</template>
			</el-table-column>
		</el-table>
		<pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList" />

		<!-- 添加或修改资源管理对话框 -->
		<el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
			<el-form ref="form" :model="form" :rules="rules" label-width="80px">
				<el-form-item prop="name"></el-form-item>
				<el-form-item prop="size"></el-form-item>
				<el-form-item label="文件链接" prop="url">
					<el-upload ref="upload" :limit="2"  :action="upload.url" :headers="upload.headers" :file-list="upload.fileList" :on-progress="handleFileUploadProgress"
						:on-success="handleFileSuccess" :auto-upload="false" :on-change="onchange" :before-upload="beforeAvatarUpload">
						<el-button slot="trigger" size="small" type="primary">选取文件</el-button>
						<el-button style="margin-left: 10px;" size="small" type="success" :loading="upload.isUploading" @click="submitUpload">上传到服务器</el-button>
						<div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
					</el-upload>
				</el-form-item>
			</el-form>
			<div slot="footer" class="dialog-footer">
				<el-button type="primary" @click="submitForm">确 定</el-button>
				<el-button @click="cancel">取 消</el-button>
			</div>
		</el-dialog>
	</div>
</template>

<script>
import { listResources, getResources, getResourceMd5, delResources, addResources, updateResources } from "@/api/system/resources";
import { getToken } from "@/utils/auth";
export default {
	name: "Resources",
	data () {
		return {
			// 遮罩层
			loading: true,
			// 选中数组
			ids: [],
			// 非单个禁用
			single: true,
			// 非多个禁用
			multiple: true,
			// 显示搜索条件
			showSearch: true,
			// 总条数
			total: 0,
			// 资源管理表格数据
			resourcesList: [],
			// 弹出层标题
			title: "",
			// 是否显示弹出层
			open: false,
			// 查询参数
			queryParams: {
				pageNum: 1,
				pageSize: 10,
				id: null,
				name: null,
				url: null,
				type: null,
				size: null,
				md5: null,
			},
			// 表单参数
			form: {},
			// 表单校验
			rules: {
			},
			// 上传参数
			upload: {
				// 是否禁用上传
				isUploading: false,
				// 设置上传的请求头部
				headers: { Authorization: "Bearer " + getToken() },
				// 上传的地址
				url: process.env.VUE_APP_BASE_API + "/common/upload",
				// 上传的文件列表
				fileList: []
			},
		};
	},
	created () {
		this.getList()
	},
	methods: {
		/** 查询资源管理列表 */
		getList () {
			this.loading = true;
			listResources(this.queryParams).then(response => {
				this.resourcesList = response.rows;
				this.total = response.total;
				this.loading = false;
			});
		},
		// 取消按钮
		cancel () {
			this.open = false;
			this.reset();
		},
		// 表单重置
		reset () {
			this.form = {
				id: null,
				name: null,
				url: null,
				type: null,
				size: null,
				delFlag: null,
				md5: null,
				createBy: null,
				createTime: null,
				updateBy: null,
				updateTime: null
			};
			this.resetForm("form");
		},
		/** 搜索按钮操作 */
		handleQuery () {
			this.queryParams.pageNum = 1;
			this.getList();
		},
		/** 重置按钮操作 */
		resetQuery () {
			this.resetForm("queryForm");
			this.handleQuery();
		},
		// 多选框选中数据
		handleSelectionChange (selection) {
			this.ids = selection.map(item => item.id)
			this.single = selection.length !== 1
			this.multiple = !selection.length
		},
		/** 新增按钮操作 */
		handleAdd () {
			this.reset();
			this.open = true;
			this.title = "添加资源管理";
			this.upload.fileList = [];
		},
		/** 修改按钮操作 */
		handleUpdate (row) {
			this.reset();
			console.log(row);
			const id = row.id || this.ids
			getResources(id).then(response => {
				this.form = response.data;
				this.open = true;
				this.title = "修改资源管理";
				this.upload.fileList = [{ name: this.form.name, url: this.form.url }];
			});
		},
		/** 提交按钮 */
		submitForm () {
			this.$refs["form"].validate(valid => {
				if (valid) {
					if (this.form.id != null) {
						updateResources(this.form).then(response => {
							this.$modal.msgSuccess("修改成功");
							this.open = false;
							this.getList();
						});
					} else {
						addResources(this.form).then(response => {
							this.$modal.msgSuccess("新增成功");
							this.open = false;
							this.getList();
						});
					}
				}
			});
		},
		/** 删除按钮操作 */
		handleDelete (row) {
			const ids = row.id || this.ids;
			this.$modal.confirm('是否确认删除资源管理编号为"' + ids + '"的数据项？').then(function () {
				return delResources(ids);
			}).then(() => {
				this.getList();
				this.$modal.msgSuccess("删除成功");
			}).catch(() => { });
		},
		/** 导出按钮操作 */
		handleExport () {
			this.download('system/resources/export', {
				...this.queryParams
			}, `resources_${new Date().getTime()}.xlsx`)
		},
		// 文件提交处理
		submitUpload () {
			this.$refs.upload.submit();
		},
		// 文件改变时
		onchange (file, fileList) {
			//如果第二次上传文件，将前一个文件删除
			//这样fileList就一直保持一个文件
			if (fileList.length > 1) {
				fileList.splice(0, 1);
			}
		},
		// 文件上传中处理
		handleFileUploadProgress (event, file, fileList) {
			this.upload.isUploading = true;
		},
		// 上传文件之前
		beforeAvatarUpload (file) {
			return getResourceMd5(file.name)
		},
		// 文件上传成功处理
		handleFileSuccess (response, file, fileList) {
			this.upload.isUploading = false;
			this.form.url = response.url;
			this.form.name = response.originalFilename;
			this.form.size = response.size;
			this.$modal.msgSuccess(response.msg);
		},
		// 文件下载处理
		handleDownload (row) {
		var name = row.name+"."+row.type;
		this.$download.saveAs(row.url, name);
		}
	}
};
</script>
<!--
https://blog.csdn.net/lucky541788/article/details/86183556
https://www.cnblogs.com/yeziyou/p/13495115.html
https://blog.csdn.net/guoshujie1/article/details/101774433?spm=1001.2101.3001.6650.3&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-3.pc_relevant_default&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-3.pc_relevant_default&utm_relevant_index=6
https://blog.csdn.net/weixin_44895283/article/details/112374326
https://blog.csdn.net/qq_37768929/article/details/108450264

-->