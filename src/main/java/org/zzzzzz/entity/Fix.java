package org.zzzzzz.entity;

import lombok.Data;

import java.sql.Date;

@Data
public class Fix {
    private int id;
    private String name;
    private String dormitoryname;
    private String describe;
    private String time;
    private String fixed;

    public Fix(){}

    public Fix(String name, String dormitoryname, String describe, String time, String fixed) {
        this.name = name;
        this.dormitoryname = dormitoryname;
        this.describe = describe;
        this.time = time;
        this.fixed = fixed;
    }
}
