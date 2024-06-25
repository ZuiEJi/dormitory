package org.zzzzzz.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.zzzzzz.entity.Absent;
import org.zzzzzz.entity.DormitoryAdmin;

import java.util.List;

@Service
public interface DormitoryAdminService {

    public List<DormitoryAdmin> list();

    public int list_count();

    public List<DormitoryAdmin> list_page(@Param("index") int index, @Param("showdate") int showdate);//index：当前是第几个页面


    public List<DormitoryAdmin> search(String key, String value);

    public void save(DormitoryAdmin dormitoryAdmin);

    public void delete(Integer id);

    public void update(DormitoryAdmin dormitoryAdmin);

}
