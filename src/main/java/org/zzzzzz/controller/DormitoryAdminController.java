package org.zzzzzz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.zzzzzz.entity.Absent;
import org.zzzzzz.entity.DormitoryAdmin;
import org.zzzzzz.service.DormitoryAdminService;
import org.zzzzzz.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/dormitoryAdmin")
public class DormitoryAdminController {

    @Autowired
    private DormitoryAdminService dormitoryAdminService;
    private Page<DormitoryAdmin> page_dormitoryAdmin = new Page<>();

    @GetMapping("/list")
    public ModelAndView list(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        //当前页面序号
        int pageIndex=1;
        String pageIndexParam = request.getParameter("pageindex");
        if(pageIndexParam!=null)
        {
            pageIndex = Integer.parseInt(pageIndexParam);
        }

        page_dormitoryAdmin.setPageindex(pageIndex);

        //获取宿舍报修信息总条数、以及分页查询
        int dormitoryAdminService_count = dormitoryAdminService.list_count();

        //获取分页查询的对象
        List<DormitoryAdmin> list_dormitoryAdmin = dormitoryAdminService.list_page((pageIndex - 1) * page_dormitoryAdmin.getShowdate(), page_dormitoryAdmin.getShowdate());

        //将总数和缺勤信息传入page对象
        page_dormitoryAdmin.setDatacount(dormitoryAdminService_count);
        page_dormitoryAdmin.setList(list_dormitoryAdmin);

        //将总的页面数传入到session中，供前端查询
        int pagecount = page_dormitoryAdmin.getPagecount();
        session.setAttribute("pagecount",pagecount);

        //将当前页面序号传入到session中，供前端查询
        session.setAttribute("pageindex", pageIndex);


        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("adminmanager");
        modelAndView.addObject("list", list_dormitoryAdmin);
        return modelAndView;
    }

    @PostMapping("/search")
    public ModelAndView search(String key, String value) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("adminmanager");
        modelAndView.addObject("list", this.dormitoryAdminService.search(key, value));
        return modelAndView;
    }

    @PostMapping("/save")
    public String save(DormitoryAdmin dormitoryAdmin) {
        this.dormitoryAdminService.save(dormitoryAdmin);
        return "redirect:/dormitoryAdmin/list";
    }

    @PostMapping("/delete")
    public String delete(Integer id) {
        this.dormitoryAdminService.delete(id);
        return "redirect:/dormitoryAdmin/list";
    }
    @PostMapping("/update")
    public String update(DormitoryAdmin dormitoryAdmin) {
        this.dormitoryAdminService.update(dormitoryAdmin);
        return "redirect:/dormitoryAdmin/list";
    }
}
