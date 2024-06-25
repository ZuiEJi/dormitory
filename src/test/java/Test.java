import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.zzzzzz.entity.Student;
import org.zzzzzz.mapper.StudentMapper;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class Test {

    @org.junit.Test //学生查询测试
    public void testSelect() throws IOException {
        ApplicationContext app=new ClassPathXmlApplicationContext("spring.xml");
        StudentMapper studentMapper = app.getBean(StudentMapper.class);
        List<Student> list = studentMapper.list();
        System.out.println("******");
        for(Student s:list) {
            System.out.println(s.toString());
        }
        System.out.println("******");
    }

    @org.junit.Test //学生更新测试
    public void testUpdate() throws IOException {
        ApplicationContext app=new ClassPathXmlApplicationContext("spring.xml");
        StudentMapper studentMapper = app.getBean(StudentMapper.class);

        Student student = new Student();
        student.setId(10);
        student.setName("xxx");
        student.setNumber("1001001");
        student.setGender("男");
        student.setDormitoryId(1);

        studentMapper.update(student);
        List<Student> studentList = studentMapper.searchByName("xyj");

        System.out.println(studentList);
    }

    @org.junit.Test //添加学生测试
    public void test() throws IOException {
        ApplicationContext app=new ClassPathXmlApplicationContext("spring.xml");
        StudentMapper studentMapper = app.getBean(StudentMapper.class);
        Student student = new Student();

        student.setName("test3");
        student.setNumber("911");
        student.setGender("男");
        student.setDormitoryId(1);
        student.setCreateDate("2022-04-14");

        int save = studentMapper.save(student);
        if(save==1)
        {
            System.out.println("插入成功");
        }
        else
            System.out.println("插入失败");
    }


}
