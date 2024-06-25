package org.zzzzzz.service;

import org.apache.ibatis.annotations.Param;
import org.zzzzzz.entity.Absent;
import org.zzzzzz.entity.Fix;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface AbsentService {

    public List<Absent> list();
    public List<Absent> search(String key, String value);

    //查询总共的缺勤条数
    public int list_count();

    //按照分页查询寝室报修信息
    public List<Absent> list_page(@Param("index") int index, @Param("showdate") int showdate);//index：当前是第几个页面

    public void save(Absent absent);

}
