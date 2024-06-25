package org.zzzzzz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.zzzzzz.entity.Absent;
import org.zzzzzz.entity.Dormitory;
import org.zzzzzz.entity.Student;
import org.zzzzzz.service.BuildingService;
import org.zzzzzz.service.DormitoryService;
import org.zzzzzz.service.StudentService;
import org.zzzzzz.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/dormitory")
public class DormitoryController {

    @Autowired
    private DormitoryService dormitoryService;

    @Autowired
    private BuildingService buildingService;

    @Autowired
    private StudentService studentService;

    private Page<Dormitory> page_dormitory = new Page<>();

    @GetMapping("/list")
    public ModelAndView list(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        //当前页面序号
        int pageIndex=1;
        String pageIndexParam = request.getParameter("pageindex");
        if(pageIndexParam!=null)
        {
            pageIndex = Integer.parseInt(pageIndexParam);
        }
        page_dormitory.setPageindex(pageIndex);

        //获取宿舍报修信息总条数、以及分页查询
        int dormitory_count = dormitoryService.list_count();

        //获取分页查询的对象
        List<Dormitory> list_dormitory = dormitoryService.list_page((pageIndex - 1) * page_dormitory.getShowdate(), page_dormitory.getShowdate());

        //将总数和缺勤信息传入page对象
        page_dormitory.setDatacount(dormitory_count);
        page_dormitory.setList(list_dormitory);

        //将总的页面数传入到session中，供前端查询
        int pagecount = page_dormitory.getPagecount();
        session.setAttribute("pagecount",pagecount);

        //将当前页面序号传入到session中，供前端查询
        session.setAttribute("pageindex", pageIndex);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("dormitorymanager");
        modelAndView.addObject("list", list_dormitory);
        modelAndView.addObject("buildingList", this.buildingService.list());
        return modelAndView;
    }

    @PostMapping("/search")
    public ModelAndView search(String key, String value) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("dormitorymanager");
        modelAndView.addObject("list", this.dormitoryService.search(key, value));
        modelAndView.addObject("buildingList", this.buildingService.list());
        return modelAndView;
    }

    @PostMapping("/save")
    public String save(Dormitory dormitory) {
        this.dormitoryService.save(dormitory);
        return "redirect:/dormitory/list";
    }

    @PostMapping("/update")
    public String update(Dormitory dormitory) {
        this.dormitoryService.update(dormitory);
        return "redirect:/dormitory/list";
    }

    @PostMapping("/delete")
    public String delete(Integer id) {
        this.dormitoryService.delete(id);
        return "redirect:/dormitory/list";
    }

    @PostMapping("/findByBuildingId")
    @ResponseBody
    public List findByBuildingId(Integer buildingId) {
        List<Dormitory> dormitoryList = this.dormitoryService.findByBuildingId(buildingId);// json数据需要添加依赖
        List list = new ArrayList();
        if(dormitoryList.size() > 0) {
            List<Student> studentList = studentService.findByDormitory(dormitoryList.get(0).getId());
            list.add(dormitoryList);
            if(studentList.size() > 0) {
                list.add(studentList);
            } else {
                list.add(new ArrayList<>());
            }
        } else {
            list.add(new ArrayList<>());
            list.add(new ArrayList<>());
        }
        return list;
    }

}
