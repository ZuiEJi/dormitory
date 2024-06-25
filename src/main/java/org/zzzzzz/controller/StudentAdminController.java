package org.zzzzzz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.zzzzzz.entity.Absent;
import org.zzzzzz.entity.Fix;
import org.zzzzzz.entity.Student;
import org.zzzzzz.mapper.StudentAbsentMapper;
import org.zzzzzz.mapper.StudentAdminMapper;
import org.zzzzzz.mapper.StudentFixMapper;
import org.zzzzzz.util.Page;

import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/studentadmin")
public class StudentAdminController {

    @Autowired
    private StudentAdminMapper studentAdminMapper;
    
    @Autowired
    private StudentAbsentMapper studentAbsentMapper;

    @Autowired
    private StudentFixMapper studentFixMapper;

    private Page<Absent> page_absent = new Page<>();

    private Page<Fix> page_fix = new Page<>();


    @GetMapping("/infor")
    public ModelAndView list(HttpSession session) {
        Student studentAdmin =(Student)session.getAttribute("studentAdmin");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("studentinfor");
        modelAndView.addObject("student", studentAdmin);
        return modelAndView;
    }

    //学生缺勤信息
    @GetMapping("/studentabsent")
    public ModelAndView studentabsent(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        //当前页面序号
        int pageIndex=1;
        String pageIndexParam = request.getParameter("pageindex");
        if(pageIndexParam!=null)
        {
            pageIndex = Integer.parseInt(pageIndexParam);
        }

        //page_absent.setPageindex(pageIndex);

        //获取学生对象
        Student studentAdmin =(Student)session.getAttribute("studentAdmin");

        /*//获取当前学生缺勤信息list
        List<Absent> list = studentAbsentMapper.list_all(studentAdmin.getName());
        Collections.reverse(list);
        */

        //获取当前学生缺勤总数
        int count = studentAbsentMapper.list_count(studentAdmin.getName());

        //按照分页查询学生缺勤信息
        List<Absent> list_absents = studentAbsentMapper.list_page(studentAdmin.getName(), (pageIndex - 1) * page_absent.getShowdate(),page_absent.getShowdate());

        //将总数和缺勤信息传入page对象
        page_absent.setDatacount(count);
        page_absent.setList(list_absents);
        List<Absent> list = page_absent.getList();

        //将总的页面数传入到session中，供前端查询
        int pagecount = page_absent.getPagecount();
        session.setAttribute("pagecount",pagecount);

        //将当前页面信息传入到session中，供前端查询
        session.setAttribute("pageindex", pageIndex);


        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("studentabsent");
        modelAndView.addObject("list",list);
        return modelAndView;
    }

    //宿舍报修信息
@GetMapping("/studentfix")
        public ModelAndView studentfix(HttpServletRequest request, HttpServletResponse response,HttpSession session) {

        //当前页面序号
        int pageIndex=1;
        String pageIndexParam = request.getParameter("pageindex");
        System.out.println("////////");
        System.out.println("pageIndexParam:"+pageIndexParam);
        System.out.println("pageIndex:"+pageIndex);
        System.out.println("////////");
        if(pageIndexParam!=null)
        {
            pageIndex = Integer.parseInt(pageIndexParam);
        }
        System.out.println("////////");
        System.out.println("pageIndex————2:"+pageIndex);
        System.out.println("////////");

        //获取当前学生对象
        Student studentAdmin =(Student)session.getAttribute("studentAdmin");
        List<Fix> list1 = studentFixMapper.list(studentAdmin.getName());

        //获取当前学生宿舍报修信息、信息总条数、
        List<Fix> list_fix = studentFixMapper.list_page(studentAdmin.getName(), (pageIndex - 1) * page_absent.getShowdate(), page_absent.getShowdate());
        int fix_count = studentFixMapper.list_count(studentAdmin.getName());

        //将总数和宿舍报修信息传入page对象
        page_fix.setList(list_fix);
        page_fix.setDatacount(fix_count);


        //将总的页面数传入到session中，供前端查询
        int pagecount = page_fix.getPagecount();
        session.setAttribute("pagecount",pagecount);

        //将当前页面序号传入到session中，供前端查询
        session.setAttribute("pageindex", pageIndex);

        System.out.println("page_fix:"+page_fix.toString()+"/////");

        for (Fix fix:list_fix
        ) {
            System.out.println(fix);
        }


        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("studentfix");
        modelAndView.addObject("list", list_fix);
        modelAndView.addObject("student", studentAdmin);
        return modelAndView;
    }
}
