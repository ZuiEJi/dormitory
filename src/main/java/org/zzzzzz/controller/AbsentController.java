package org.zzzzzz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.zzzzzz.entity.*;
import org.zzzzzz.service.AbsentService;
import org.zzzzzz.service.BuildingService;
import org.zzzzzz.service.DormitoryService;
import org.zzzzzz.service.StudentService;
import org.zzzzzz.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/absent")
public class AbsentController {

    @Autowired
    private AbsentService absentService;

    @Autowired
    private BuildingService buildingService;

    @Autowired
    private DormitoryService dormitoryService;

    @Autowired
    private StudentService studentService;
    private Page<Absent> page_absent = new Page<>();

    @GetMapping("/list")
    public ModelAndView list(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        //获取当前页面序号，初始默认为1
        int pageIndex=1;
        String pageIndexParam = request.getParameter("pageindex");
        if(pageIndexParam!=null)
        {
            pageIndex = Integer.parseInt(pageIndexParam);
        }
        page_absent.setPageindex(pageIndex);

        //获取宿舍报修信息总条数、以及分页查询
        int absent_count = absentService.list_count();
        System.out.println(absent_count);

        //获取分页查询的对象
        List<Absent> list_absent = absentService.list_page((pageIndex - 1) * page_absent.getShowdate(), page_absent.getShowdate());

        //将总数和缺勤信息传入page对象
        page_absent.setDatacount(absent_count);
        page_absent.setList(list_absent);

        //将总的页面数传入到session中，供前端查询
        int pagecount = page_absent.getPagecount();
        session.setAttribute("pagecount",pagecount);

        //将当前页面序号传入到session中，供前端查询
        session.setAttribute("pageindex", pageIndex);


        /*List<Absent> list = absentService.list();
        Collections.reverse(list);*/

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("absentrecord");
        modelAndView.addObject("list", list_absent);
        return modelAndView;
    }

    @PostMapping("/search")
    public ModelAndView search(String key, String value) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("absentrecord");
        modelAndView.addObject("list", this.absentService.search(key, value));
        return modelAndView;
    }

    @GetMapping("/init")
    public ModelAndView init() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("absentregister");
        List<Building> buildingList = this.buildingService.list();
        modelAndView.addObject("buildingList", buildingList);
        List<Dormitory> dormitoryList = this.dormitoryService.findByBuildingId(buildingList.get(0).getId());
        modelAndView.addObject("dormitoryList", dormitoryList);
        List<Student> studentList = this.studentService.findByDormitory(dormitoryList.get(0).getId());
        modelAndView.addObject("studentList", studentList);
        return modelAndView;
    }

    @PostMapping("/save")
    public String save(Absent absent, HttpSession session) {
        DormitoryAdmin dormitoryAdmin = (DormitoryAdmin) session.getAttribute("dormitoryAdmin");
        absent.setDormitoryAdminId(dormitoryAdmin.getId());
        this.absentService.save(absent);
        return "redirect:/absent/init";
    }

}
