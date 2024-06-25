package org.zzzzzz.mapper;

import org.apache.ibatis.annotations.Param;
import org.zzzzzz.entity.Absent;

import java.util.List;

public interface StudentAbsentMapper {

    //当前学生的所有缺勤信息
    public List<Absent> list_all(String name);

    //按照分页查询当前学生的缺勤信息
    public List<Absent> list_page(@Param("name") String name, @Param("index") int index, @Param("showdate") int showdate);//index：当前是第几个页面

    //当前学生缺勤信息的总数
    public int list_count(String name);
}
