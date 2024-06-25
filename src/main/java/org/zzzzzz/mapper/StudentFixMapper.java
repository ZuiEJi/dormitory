package org.zzzzzz.mapper;

import org.apache.ibatis.annotations.Param;
import org.zzzzzz.entity.Absent;
import org.zzzzzz.entity.Fix;

import java.util.List;

public interface StudentFixMapper {

    //查询当前学生的宿舍报修信息
    public List<Fix> list(String name);

    //查询当前学生的宿舍报修信息总条数
    public int list_count(String name);

    //按照分页查询当前学生的宿舍报修信息
    public List<Fix> list_page(@Param("name") String name, @Param("index") int index, @Param("showdate") int showdate);//index：当前是第几个页面

    //存储报修信息
    public void save(Fix fix);

}
