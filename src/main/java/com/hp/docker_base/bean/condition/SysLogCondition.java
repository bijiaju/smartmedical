package com.hp.docker_base.bean.condition;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/8/15 11:35
 */

public class SysLogCondition {

    private String startDate;
    private String endDate;
    private String keywords;

    public SysLogCondition(){

    }

    public SysLogCondition(String startDate, String endDate, String keywords) {
        this.startDate = startDate;
        this.endDate = endDate;
        this.keywords = keywords;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }
}
