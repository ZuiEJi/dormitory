package org.zzzzzz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zzzzzz.dto.AccountDto;
import org.zzzzzz.entity.DormitoryAdmin;
import org.zzzzzz.entity.Student;
import org.zzzzzz.entity.SystemAdmin;
import org.zzzzzz.form.AccountForm;
import org.zzzzzz.mapper.DormitoryAdminMapper;
import org.zzzzzz.mapper.StudentAdminMapper;
import org.zzzzzz.mapper.SystemAdminMapper;
import org.zzzzzz.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    private SystemAdminMapper systemAdminMapper;

    @Autowired
    private DormitoryAdminMapper dormitoryAdminMapper;

    @Autowired
    private StudentAdminMapper studentAdminMapper;


    @Override
    public AccountDto login(AccountForm accountForm) {
        AccountDto dto = new AccountDto();  // 定义返回集

        switch (accountForm.getType()) {
            case "systemAdmin" :
                SystemAdmin systemAdmin = this.systemAdminMapper.findByUsername(accountForm.getUsername());

                if (systemAdmin == null) {
                    dto.setCode(-1);  // 设置 用户名错误 状态码
                } else if(!systemAdmin.getPassword().equals(accountForm.getPassword())) {
                    dto.setCode(-2);  // 设置 密码错误 状态码
                } else if (systemAdmin.getPassword().equals(accountForm.getPassword())){
                    dto.setCode(0);  // 设置 登录成功 状态码
                    dto.setAdmin(systemAdmin);  // 设置 管理员 信息
                }
                break;
            case "dormitoryAdmin" :
                DormitoryAdmin dormitoryAdmin = this.dormitoryAdminMapper.findByUserName(accountForm.getUsername());
                if(dormitoryAdmin == null) {
                    dto.setCode(-1);
                } else {
                    if(!dormitoryAdmin.getPassword().equals(accountForm.getPassword())) {
                        dto.setCode(-2);
                    } else {
                        dto.setCode(0);
                        dto.setAdmin(dormitoryAdmin);
                    }
                }
                break;
            case "studentAdmin" :
                //通过查询登录名获取student用户
                Student student = this.studentAdminMapper.searchByName(accountForm.getUsername());
                if(student == null) {
                    dto.setCode(-1);
                } else {
                    if(!student.getPassword().equals(accountForm.getPassword())) {
                        dto.setCode(-2);
                    } else {
                        dto.setCode(0);
                        //返回查询到的学生
                        dto.setAdmin(student);
                    }
                }
                break;
        }
        return dto;
    }
}
