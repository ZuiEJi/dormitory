package org.zzzzzz.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.zzzzzz.entity.Dormitory;
import org.zzzzzz.entity.Moveout;

import java.util.List;

@Service
public interface MoveoutService {
    public List<Moveout> list();
    public List<Moveout> search(String key, String value);

    public int list_count();

    public List<Moveout> list_page(@Param("index") int index, @Param("showdate") int showdate);//index：当前是第几个页面

}
