package org.zzzzzz.service.impl;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zzzzzz.entity.Absent;
import org.zzzzzz.entity.DormitoryAdmin;
import org.zzzzzz.mapper.DormitoryAdminMapper;
import org.zzzzzz.service.DormitoryAdminService;

import java.util.List;

@Service
public class DormitoryAdminServiceImpl implements DormitoryAdminService {

    @Autowired
    private DormitoryAdminMapper dormitoryAdminMapper;

    @Override
    public List<DormitoryAdmin> list() {
        return this.dormitoryAdminMapper.list();
    }

    public int list_count(){
        return this.dormitoryAdminMapper.list_count();
    }

    public List<DormitoryAdmin> list_page(@Param("index") int index, @Param("showdate") int showdate){
        return this.dormitoryAdminMapper.list_page(index,showdate);
    }//index：当前是第几个页面


    @Override
    public List<DormitoryAdmin> search(String key, String value) {
        if(value.equals("")) return list();

        List<DormitoryAdmin> list = null;

        switch (key) {
            case "username" :
                list = dormitoryAdminMapper.searchByUsername(value);
                break;
            case "name" :
                list = dormitoryAdminMapper.searchByName(value);
                break;
            case "telephone" :
                list = dormitoryAdminMapper.searchByTelephone(value);
                break;
        }

        return list;
    }

    @Override
    public void save(DormitoryAdmin dormitoryAdmin) {
        try {
            this.dormitoryAdminMapper.save(dormitoryAdmin);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(Integer id) {
        try {
            this.dormitoryAdminMapper.delete(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(DormitoryAdmin dormitoryAdmin) {
        try {
            this.dormitoryAdminMapper.update(dormitoryAdmin);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
