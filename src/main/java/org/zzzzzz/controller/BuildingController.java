package org.zzzzzz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.zzzzzz.entity.Absent;
import org.zzzzzz.entity.Building;
import org.zzzzzz.entity.Dormitory;
import org.zzzzzz.mapper.BuildingMapper;
import org.zzzzzz.service.BuildingService;
import org.zzzzzz.service.DormitoryAdminService;
import org.zzzzzz.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/building")
public class BuildingController {

    @Autowired
    private BuildingService buildingService;

    @Autowired
    private DormitoryAdminService dormitoryAdminService;

    private Page<Building> page_building = new Page<>();

    @GetMapping("/list")
    public ModelAndView list(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
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

        page_building.setPageindex(pageIndex);

        //获取宿舍报修信息总条数、以及分页查询
        int build_count = buildingService.list_count();
        System.out.println(build_count);

        System.out.println((pageIndex - 1) * page_building.getShowdate());
        System.out.println(page_building.getShowdate());

        //获取分页查询的对象
        List<Building> list_building = buildingService.list_page((pageIndex - 1) * page_building.getShowdate(), page_building.getShowdate());

        //将总数和缺勤信息传入page对象
        page_building.setDatacount(build_count);
        page_building.setList(list_building);

        //将总的页面数传入到session中，供前端查询
        int pagecount = page_building.getPagecount();
        session.setAttribute("pagecount",pagecount);

        //将当前页面序号传入到session中，供前端查询
        session.setAttribute("pageindex", pageIndex);

        System.out.println("page_fix:"+page_building.toString()+"/////");

        for (Building building:list_building
        ) {
            System.out.println(building);
        }

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("buildingmanager");
        modelAndView.addObject("list",list_building);
        modelAndView.addObject("dormitoryAdminList", dormitoryAdminService.list());
        return modelAndView;
    }

    @PostMapping("/search")
    public ModelAndView serach(String key, String value) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("buildingmanager");
        modelAndView.addObject("list", buildingService.search(key, value));
        modelAndView.addObject("dormitoryAdminList", dormitoryAdminService.list());
        return modelAndView;
    }

    @PostMapping("/save")
    public String save(Building building) {
        this.buildingService.save(building);
        return "redirect:/building/list";
    }

    @PostMapping("/update")
    public String update(Building building) {
        this.buildingService.update(building);
        return "redirect:/building/list";
    }

    @PostMapping("/delete")
    public String delete(Integer id) {
        this.buildingService.delete(id);
        return "redirect:/building/list";
    }

}
