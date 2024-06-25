package org.zzzzzz.mapper;

import org.apache.ibatis.annotations.Param;
import org.zzzzzz.entity.Moveout;

import java.util.List;

public interface MoveoutMapper {
    public List<Moveout> list();
    public List<Moveout> searchByStudentName(String value);
    public List<Moveout> searchByDormitoryName(String value);

    public int list_count();

    public List<Moveout> list_page(@Param("index") int index, @Param("showdate") int showdate);//index：当前是第几个页面


}
