package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.SysResources;
import com.ruoyi.system.service.ISysResourcesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 资源管理Controller
 * @author xiaobai
 * @date 2022-03-27
 */
@RestController
@RequestMapping("/system/resources")
public class SysResourcesController extends BaseController {
    @Autowired
    private ISysResourcesService sysResourcesService;

    /**
     * 查询资源管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:resources:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysResources sysResources) {
        startPage();
        List<SysResources> list = sysResourcesService.selectSysResourcesList(sysResources);
        return getDataTable(list);
    }

    /**
     * 导出资源管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:resources:export')")
    @Log(title = "资源管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysResources sysResources) {
        List<SysResources> list = sysResourcesService.selectSysResourcesList(sysResources);
        ExcelUtil<SysResources> util = new ExcelUtil<SysResources>(SysResources.class);
        util.exportExcel(response, list, "资源管理数据");
    }

    /**
     * 获取资源管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:resources:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(sysResourcesService.selectSysResourcesById(id));
    }

    /**
     * 新增资源管理
     */
    @PreAuthorize("@ss.hasPermi('system:resources:add')")
    @Log(title = "资源管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysResources sysResources) throws Exception {
        // TODO：返回结果
        //sysResourcesService.insertSysResources(sysResources);
        return sysResourcesService.insertSysResources(sysResources);
    }

    /**
     * 修改资源管理
     */
    @PreAuthorize("@ss.hasPermi('system:resources:edit')")
    @Log(title = "资源管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysResources sysResources) {
        return toAjax(sysResourcesService.updateSysResources(sysResources));
    }

    /**
     * 删除资源管理
     */
    @PreAuthorize("@ss.hasPermi('system:resources:remove')")
    @Log(title = "资源管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(sysResourcesService.deleteSysResourcesByIds(ids));
    }

    @GetMapping("/getMd5/{name}")
    public AjaxResult getMd5(@PathVariable("name") String name){
        return sysResourcesService.getMd5(name);
    }
}
