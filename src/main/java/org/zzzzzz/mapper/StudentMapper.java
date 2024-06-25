package org.zzzzzz.mapper;

import lombok.experimental.PackagePrivate;
import org.apache.ibatis.annotations.Param;
import org.zzzzzz.entity.Moveout;
import org.zzzzzz.entity.Student;

import java.util.List;

public interface StudentMapper {
    public List<Student> list();

    public int listStudentCount();

    public int listmovecount();

    public List<Student> list_movepage(@Param("index") int index, @Param("showdate") int showdate);//index：当前是第几个页面

    public List<Student> listPage(@Param("index") int index, @Param("showdate") int showdate);

    public List<Student> searchByNumber(String number);

    public List<Student> searchByName(String name);

    public int save(Student student);

    public void update(Student student);

    public void delete(Student student);

    public List<Integer> findStudentIdByDormitoryId(Integer dormitoryId);

    public void resetDormitoryId(@Param("id") Integer studentId, @Param("dormitory_id") Integer dormitoryId);

    public List<Student> moveoutList();

    public List<Student> searchForMoveoutByName(String name);
    public List<Student> searchForMoveoutByNumber(String number);

    public void updateStateById(Integer id);

    public void moveout(Moveout moveout);

    public List<Student> findByDormitoryId(Integer dormitoryId);
}
