package org.zzzzzz.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.zzzzzz.entity.Absent;
import org.zzzzzz.entity.Dormitory;

import java.util.List;

@Service
public interface DormitoryService {
    public List<Dormitory> availableList();
    public List<Dormitory> list();

    public int list_count();

    public List<Dormitory> list_page(@Param("index") int index, @Param("showdate") int showdate);//index：当前是第几个页面


    public List<Dormitory> search(String key, String value);

    public void save(Dormitory dormitory);

    public void update(Dormitory dormitory);

    public void delete(Integer id);

    public List<Dormitory> findByBuildingId(Integer buildingId);
}
