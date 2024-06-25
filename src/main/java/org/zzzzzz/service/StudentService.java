package org.zzzzzz.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.zzzzzz.entity.Moveout;
import org.zzzzzz.entity.Student;

import java.util.List;

@Service
public interface StudentService {
    public List<Student> list();

    public int listStudentCount();

    public List<Student> listPage(@Param("index") int index, @Param("showdate") int showdate);

    public int listMovecount();

    public List<Student> list_movepage(@Param("index") int index, @Param("showdate") int showdate);//index：当前是第几个页面



    public List<Student> search(String key, String value);

    public void save(Student student);

    public void update(Student student);

    public void delete(Student student);

    public List<Student> moveoutList();

    public List<Student> searchForMoveoutList(String key, String value);

    public void moveout(Moveout moveout);

    public List<Student> findByDormitory(Integer dormitoryId);
}
