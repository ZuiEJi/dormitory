package org.zzzzzz.mapper;

import org.apache.ibatis.annotations.Param;
import org.zzzzzz.entity.Building;
import org.zzzzzz.entity.DormitoryAdmin;

import java.util.List;

public interface  BuildingMapper {
    public List<Building> list();

    public int list_count();

    public List<Building> list_page(@Param("index") int index, @Param("showdate") int showdate);//index：当前是第几个页面


    public List<Building> searchByName(String name);
    public List<Building> searchByIntrodution(String introduction);

    public void save(Building building);
    public void update(Building building);
    public void delete(Integer id);

}
