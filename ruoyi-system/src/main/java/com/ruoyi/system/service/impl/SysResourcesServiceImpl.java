package com.ruoyi.system.service.impl;

import java.util.List;

import cn.hutool.crypto.SecureUtil;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysResourcesMapper;
import com.ruoyi.system.domain.SysResources;
import com.ruoyi.system.service.ISysResourcesService;

/**
 * 资源管理Service业务层处理
 * @author xiaobai
 * @date 2022-03-27
 */
@Service
public class SysResourcesServiceImpl implements ISysResourcesService {
    @Autowired
    private SysResourcesMapper sysResourcesMapper;

    /**
     * 查询资源管理
     * @param id 资源管理主键
     * @return 资源管理
     */
    @Override
    public SysResources selectSysResourcesById(Long id) {
        return sysResourcesMapper.selectSysResourcesById(id);
    }

    /**
     * 查询资源管理列表
     * @param sysResources 资源管理
     * @return 资源管理
     */
    @Override
    public List<SysResources> selectSysResourcesList(SysResources sysResources) {
        return sysResourcesMapper.selectSysResourcesList(sysResources);
    }

    /**
     * 新增资源管理
     * @param sysResources 资源管理
     * @return 结果
     */
    @Override
    public AjaxResult insertSysResources(SysResources sysResources) throws Exception {
        sysResources.setCreateBy(SecurityUtils.getUsername());
        sysResources.setCreateTime(DateUtils.getNowDate());
        sysResources.setType(sysResources.getUrl().substring(sysResources.getUrl().lastIndexOf('.') + 1));
        sysResources.setSize(sysResources.getSize() / 1024);
        String md5 = SecureUtil.md5(sysResources.getName());
        SysResources fileMd5 = getFileMd5(md5);
        //System.out.println(fileMd5);
        if (fileMd5 != null) {
            return AjaxResult.error(412, "该文件已存在");
        }
        sysResources.setMd5(md5);
        sysResources.setName(sysResources.getName().substring(0, sysResources.getName().indexOf(".")));
        //System.out.println(sysResources);
        //System.out.println(md5);
        //System.out.println(sysResources.getName());
        //System.out.println(sysResources.getName().substring(0, sysResources.getName().indexOf(".")));
        //System.out.println(sysResources.getUrl().substring(sysResources.getUrl().lastIndexOf('/')+1));
        //return 0;
        int resources = sysResourcesMapper.insertSysResources(sysResources);
        return AjaxResult.success(resources);
    }

    private SysResources getFileMd5(String md5) {
        // 查询文件的md5是否存在
        List<SysResources> list = sysResourcesMapper.selectMd5(md5);
        //System.out.println(list);
        return list.size() == 0 ? null : list.get(0);
    }

    /**
     * 修改资源管理
     * @param sysResources 资源管理
     * @return 结果
     */
    @Override
    public int updateSysResources(SysResources sysResources) {
        sysResources.setUpdateTime(DateUtils.getNowDate());
        sysResources.setUpdateBy(SecurityUtils.getUsername());
        return sysResourcesMapper.updateSysResources(sysResources);
    }

    /**
     * 批量删除资源管理
     * @param ids 需要删除的资源管理主键
     * @return 结果
     */
    @Override
    public int deleteSysResourcesByIds(Long[] ids) {
        return sysResourcesMapper.deleteSysResourcesByIds(ids);
    }

    /**
     * 删除资源管理信息
     * @param id 资源管理主键
     * @return 结果
     */
    @Override
    public int deleteSysResourcesById(Long id) {
        return sysResourcesMapper.deleteSysResourcesById(id);
    }

    @Override
    public AjaxResult getMd5(String name) {
        SysResources fileMd5 = getFileMd5(SecureUtil.md5(name));
        if (fileMd5 != null) {
            return AjaxResult.error(412,"该文件已存在");
        } else {
            return AjaxResult.success();
        }
    }
}
