package org.zzzzzz.mapper;

import org.apache.ibatis.annotations.Param;
import org.zzzzzz.entity.Absent;
import org.zzzzzz.entity.DormitoryAdmin;
import org.zzzzzz.service.DormitoryAdminService;

import java.util.List;

public interface DormitoryAdminMapper {

    public List<DormitoryAdmin> list();
    public int list_count();
    public List<DormitoryAdmin> list_page(@Param("index") int index, @Param("showdate") int showdate);//index：当前是第几个页面

    public List<DormitoryAdmin> searchByUsername(String username);
    public List<DormitoryAdmin> searchByName(String name);
    public List<DormitoryAdmin> searchByTelephone(String telephone);
    public void save(DormitoryAdmin dormitoryAdmin);
    public void delete(Integer id);
    public void update(DormitoryAdmin dormitoryAdmin);
    public DormitoryAdmin findByUserName(String username);

}
