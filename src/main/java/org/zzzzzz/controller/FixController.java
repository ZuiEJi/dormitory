package org.zzzzzz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.zzzzzz.entity.Fix;
import org.zzzzzz.entity.Student;
import org.zzzzzz.mapper.DormitiryFixMapper;
import org.zzzzzz.mapper.StudentFixMapper;
import org.zzzzzz.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/fix")
public class FixController {

    @Autowired
    private StudentFixMapper studentFixMapper;

    @Autowired
    private DormitiryFixMapper dormitiryFixMapper;

    private Page<Fix> page_fix = new Page<>();

    @PostMapping("/save")
    public String save(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        Student studentAdmin =(Student)session.getAttribute("studentAdmin");
        // 设置请求的编码
        request.setCharacterEncoding("UTF-8");
        LocalDateTime now = LocalDateTime.now();
        // 格式化时间
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedNow = now.format(formatter);

        // 获取表单参数
        String name = studentAdmin.getName();
        String dormitoryName = studentAdmin.getDormitoryName();
        String describe = request.getParameter("describe");
        String fixed = "未完成";

        Fix fix = new Fix(name,dormitoryName, describe,formattedNow, fixed);
        studentFixMapper.save(fix);
        return "redirect:/studentadmin/studentfix";
    }

    @GetMapping("/dormitoryfix")
    public ModelAndView dormitoryfix(HttpServletRequest request, HttpServletResponse response,HttpSession session){

        //当前页面序号
        int pageIndex=1;
        String pageIndexParam = request.getParameter("pageindex");
        if(pageIndexParam!=null)
        {
            pageIndex = Integer.parseInt(pageIndexParam);
        }

        
        /*//获取所有宿舍报修新信息
        List<Fix> list = dormitiryFixMapper.list();
        Collections.reverse(list);*/
        
        //获取宿舍报修信息总条数、以及分页查询
        int fix_count = dormitiryFixMapper.list_count();
        List<Fix> list_fix = dormitiryFixMapper.list_page((pageIndex - 1) * page_fix.getShowdate(), page_fix.getShowdate());

        //将总数和宿舍报修信息传入page对象
        page_fix.setList(list_fix);
        page_fix.setDatacount(fix_count);

        //将总的页面数传入到session中，供前端查询
        int pagecount = page_fix.getPagecount();
        session.setAttribute("pagecount",pagecount);

        //将当前页面序号传入到session中，供前端查询
        session.setAttribute("pageindex", pageIndex);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("dormitoryfix");
        modelAndView.addObject("list", list_fix);
        return modelAndView;
    }

    @PostMapping("/button")
    public String button(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 设置请求的编码
        request.setCharacterEncoding("UTF-8");
        // 获取表单参数
        String id = request.getParameter("id");
        dormitiryFixMapper.fixed(id);
        return "redirect:/fix/dormitoryfix";
    }

}
