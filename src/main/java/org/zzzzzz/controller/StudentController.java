package org.zzzzzz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.zzzzzz.entity.Absent;
import org.zzzzzz.entity.Student;
import org.zzzzzz.service.DormitoryService;
import org.zzzzzz.service.StudentService;
import org.zzzzzz.util.Page;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private DormitoryService dormitoryService;

    private Page<Student> page_student = new Page<>();

    @GetMapping("/list")
    public ModelAndView list(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        //当前页面序号
        int pageIndex=1;
        String pageIndexParam = request.getParameter("pageindex");
        if(pageIndexParam!=null)
        {
            pageIndex = Integer.parseInt(pageIndexParam);
        }
        System.out.println("////////");
        System.out.println("pageIndex————2:"+pageIndex);
        System.out.println("////////");

        page_student.setPageindex(pageIndex);

        //获取学生信息总条数、以及分页查询
        int student_count = studentService.listStudentCount();

        //获取分页查询的对象
        List<Student> list_student = studentService.listPage((pageIndex - 1) * page_student.getShowdate(), page_student.getShowdate());

        //将总数和缺勤信息传入page对象
        page_student.setDatacount(student_count);
        page_student.setList(list_student);

        //将总的页面数传入到session中，供前端查询
        int pagecount = page_student.getPagecount();
        session.setAttribute("pagecount",pagecount);

        //将当前页面序号传入到session中，供前端查询
        session.setAttribute("pageindex", pageIndex);


        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("studentmanager");
        modelAndView.addObject("list", list_student);
        modelAndView.addObject("dormitoryList", this.dormitoryService.availableList());
        return modelAndView;
    }

    @PostMapping("/search")
    public ModelAndView search(String key, String value) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("studentmanager");
        modelAndView.addObject("list", this.studentService.search(key, value));
        modelAndView.addObject("dormitoryList", this.dormitoryService.availableList());
        return modelAndView;
    }

    @PostMapping("/save")
    public String save(Student student) {
        this.studentService.save(student);
        return "redirect:/student/list";
    }

    @PostMapping("/update")
    public String update(Student student) {
        this.studentService.update(student);
        return "redirect:/student/list";
    }


    @PostMapping("/delete")
    public String delete(Student student) {
        this.studentService.delete(student);
        return "redirect:/student/list";
    }

    @PostMapping("/findByDormitoryId")
    @ResponseBody // JSON格式的数据
    public List<Student> findByDormitoryId(Integer dormitoryId) {
        return studentService.findByDormitory(dormitoryId);
    }



}
