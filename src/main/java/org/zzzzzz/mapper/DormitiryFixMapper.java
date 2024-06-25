package org.zzzzzz.mapper;

import org.apache.ibatis.annotations.Param;
import org.zzzzzz.entity.Fix;

import java.util.List;

public interface DormitiryFixMapper {

    //所有的寝室报修查询
    public List<Fix> list();

    //寝室报修总数查询
    public int list_count();

    //按照分页查询寝室报修信息
    public List<Fix> list_page(@Param("index") int index, @Param("showdate") int showdate);//index：当前是第几个页面

    //点击按钮后将维修状态更改为已完成
    public void fixed(String id);
}
