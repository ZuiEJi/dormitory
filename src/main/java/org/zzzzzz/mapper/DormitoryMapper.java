package org.zzzzzz.mapper;

import org.apache.ibatis.annotations.Param;
import org.zzzzzz.entity.Absent;
import org.zzzzzz.entity.Dormitory;

import java.util.List;

public interface DormitoryMapper {
    public List<Dormitory> availableList();

    public int list_count();

    public List<Dormitory> list_page(@Param("index") int index, @Param("showdate") int showdate);//index：当前是第几个页面


    public void subAvailable(Integer id);
    public void addAvailable(Integer id);

    public List<Integer> findDormitoryIdByBuildingId(Integer buildingId);

    public Integer findAvailableDormitoryId();

    public void delete(Integer id);

    public void setAvailableToZero(Integer id);

    public List<Dormitory> list();

    public List<Dormitory> searchByName(String name);

    public List<Dormitory> searchByTelephone(String telephone);

    public void save(Dormitory dormitory);

    public void update(Dormitory dormitory);

    public List<Dormitory> findByBuildingId(Integer buildingId);
}
