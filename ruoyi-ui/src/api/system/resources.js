import request from '@/utils/request'

// 查询资源管理列表
export function listResources(query) {
  return request({
    url: '/system/resources/list',
    method: 'get',
    params: query
  })
}

// 查询资源管理详细
export function getResources(id) {
  return request({
    url: '/system/resources/' + id,
    method: 'get'
  })
}

// 根据文件名查询md5
export function getResourceMd5(name) {
  return request({
    url: '/system/resources/getMd5/' + name,
    method: 'get'
  })
}

// 新增资源管理
export function addResources(data) {
  return request({
    url: '/system/resources',
    method: 'post',
    data: data
  })
}

// 修改资源管理
export function updateResources(data) {
  return request({
    url: '/system/resources',
    method: 'put',
    data: data
  })
}

// 删除资源管理
export function delResources(id) {
  return request({
    url: '/system/resources/' + id,
    method: 'delete'
  })
}
