package org.zzzzzz.mapper;

import org.apache.ibatis.annotations.Param;
import org.zzzzzz.entity.Absent;
import org.zzzzzz.entity.Fix;

import java.util.List;

public interface AbsentMapper {

    public List<Absent> list();
    public List<Absent> searchByBuildingName(String value);
    public List<Absent> searchByDormitoryName(String value);

    //寝室报修总数查询
    public int list_count();

    //按照分页查询寝室报修信息
    public List<Absent> list_page(@Param("index") int index, @Param("showdate") int showdate);//index：当前是第几个页面


    public void save(Absent absent);
}
