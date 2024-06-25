package org.zzzzzz.util;

import java.util.List;

public class Page<T> {

    //一共多少数据
    private int datacount;

    //一页中展示多少条数据,默认为5
    private int showdate = 5;

    //一共多少页面
    private int pagecount;

    //当前页面的编号
    private int pageindex;

    //传入的数据集
    private List<T> list;

    public int getDatacount() {
        return datacount;
    }

    public void setDatacount(int datacount) {
        this.datacount = datacount;
    }

    public int getShowdate() {
        return showdate;
    }

    public void setShowdate(int showdate) {
        this.showdate = showdate;
    }

    //计算一共分了多少个页面
    public int getPagecount() {
        int a=0;
        if(this.datacount%this.showdate==0)
        {
            a  = this.datacount/this.showdate;
        }
        else{
            a = this.datacount/this.showdate +1;
        }
        return a;
    }

   /* public void setPagecount(int pagecount) {
        return;
    }*/

    public int getPageindex() {
        return pageindex;
    }

    public void setPageindex(int pageindex) {
        this.pageindex = pageindex;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "Page{" +
                "datacount=" + datacount +
                ", showdate=" + showdate +
                ", pagecount=" + pagecount +
                ", pageindex=" + pageindex +
                '}';
    }


}
