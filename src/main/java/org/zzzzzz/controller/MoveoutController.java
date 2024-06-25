package org.zzzzzz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.zzzzzz.entity.Dormitory;
import org.zzzzzz.entity.Moveout;
import org.zzzzzz.entity.Student;
import org.zzzzzz.service.MoveoutService;
import org.zzzzzz.service.StudentService;
import org.zzzzzz.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/moveout")
public class MoveoutController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private MoveoutService moveoutService;

    private Page<Student> page_moveout = new Page<>();

    private Page<Moveout> page_record = new Page<>();

    @GetMapping("/list")
    public ModelAndView list(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        //当前页面序号
        int pageIndex=1;
        String pageIndexParam = request.getParameter("pageindex");
        if(pageIndexParam!=null)
        {
            pageIndex = Integer.parseInt(pageIndexParam);
        }
        page_moveout.setPageindex(pageIndex);

        //获取宿舍报修信息总条数、以及分页查询
        int move_count = studentService.listMovecount();

        //获取分页查询的对象
        List<Student> list_movepage = studentService.list_movepage((pageIndex - 1) * page_moveout.getShowdate(), page_moveout.getShowdate());
        //将总数和缺勤信息传入page对象
        page_moveout.setDatacount(move_count);
        page_moveout.setList(list_movepage);

        //将总的页面数传入到session中，供前端查询
        int pagecount = page_moveout.getPagecount();
        session.setAttribute("pagecount",pagecount);

        //将当前页面序号传入到session中，供前端查询
        session.setAttribute("pageindex", pageIndex);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("moveoutregister");
        modelAndView.addObject("list", list_movepage);
        return modelAndView;
    }

    @PostMapping("/search")
    public ModelAndView search(String key, String value) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("moveoutregister");
        modelAndView.addObject("list", this.studentService.searchForMoveoutList(key, value));
        return modelAndView;
    }

    @PostMapping("/register")
    public String register(Moveout moveout) {
        this.studentService.moveout(moveout);
        return "redirect:/moveout/list";
    }

    @GetMapping("/record")
    public ModelAndView recored(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
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

        page_record.setPageindex(pageIndex);

        //获取宿舍报修信息总条数、以及分页查询
        int move_count = moveoutService.list_count();
        System.out.println(move_count);



        System.out.println((pageIndex - 1) * page_record.getShowdate());
        System.out.println(page_record.getShowdate());

        //获取分页查询的对象
        List<Moveout> list_movapage = moveoutService.list_page((pageIndex - 1) * page_record.getShowdate(), page_record.getShowdate());
        //将总数和缺勤信息传入page对象
        page_record.setDatacount(move_count);
        page_record.setList(list_movapage);

        //将总的页面数传入到session中，供前端查询
        int pagecount = page_record.getPagecount();
        session.setAttribute("pagecount",pagecount);

        //将当前页面序号传入到session中，供前端查询
        session.setAttribute("pageindex", pageIndex);

        System.out.println("page_fix:"+page_record.toString()+"/////");

        for (Moveout moveout:list_movapage
        ) {
            System.out.println(moveout);
        }



        ModelAndView modelAndView = new ModelAndView();
        List<Moveout> list = moveoutService.list();
        Collections.reverse(list);
        modelAndView.setViewName("moveoutrecord");
        modelAndView.addObject("list", list_movapage);
        return modelAndView;
    }

    @PostMapping("/recordSearch")
    public ModelAndView recoredSearch(String key, String value) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("moveoutrecord");
        modelAndView.addObject("list", this.moveoutService.search(key, value));
        return modelAndView;
    }

}
