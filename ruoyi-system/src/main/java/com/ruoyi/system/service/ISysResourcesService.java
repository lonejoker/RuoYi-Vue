package com.ruoyi.system.service;

import java.util.List;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.SysResources;

/**
 * 资源管理Service接口
 * @author xiaobai
 * @date 2022-03-27
 */
public interface ISysResourcesService {
    /**
     * 查询资源管理
     *
     * @param id 资源管理主键
     * @return 资源管理
     */
    public SysResources selectSysResourcesById(Long id);

    /**
     * 查询资源管理列表
     *
     * @param sysResources 资源管理
     * @return 资源管理集合
     */
    public List<SysResources> selectSysResourcesList(SysResources sysResources);

    /**
     * 新增资源管理
     *
     * @param sysResources 资源管理
     * @return 结果
     */
    public AjaxResult insertSysResources(SysResources sysResources) throws Exception;

    /**
     * 修改资源管理
     *
     * @param sysResources 资源管理
     * @return 结果
     */
    public AjaxResult updateSysResources(SysResources sysResources);

    /**
     * 批量删除资源管理
     *
     * @param ids 需要删除的资源管理主键集合
     * @return 结果
     */
    public int deleteSysResourcesByIds(Long[] ids);

    /**
     * 删除资源管理信息
     *
     * @param id 资源管理主键
     * @return 结果
     */
    public int deleteSysResourcesById(Long id);

    public AjaxResult getMd5(String name);
}
