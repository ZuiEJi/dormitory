package org.zzzzzz.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.zzzzzz.entity.Building;
import org.zzzzzz.entity.DormitoryAdmin;

import java.util.List;

@Service
public interface BuildingService {
    public List<Building> list();

    public int list_count();

    public List<Building> list_page(@Param("index") int index, @Param("showdate") int showdate);//index：当前是第几个页面


    public List<Building> search(String key, String value);

    public void save(Building building);

    public void update(Building building);

    public void delete(Integer id);
}
