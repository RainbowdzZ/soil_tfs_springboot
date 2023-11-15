package com.ruoyi.wx.domain.dto;

import java.time.LocalDateTime;
import java.util.Date;

public class CouponIssueFormDTO {

    private Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    private LocalDateTime issueBeginTime;

    private LocalDateTime issueEndTime;

    private LocalDateTime termBeginTime;

    private LocalDateTime termEndTime;

    private Long termDays;

    public LocalDateTime getIssueBeginTime() {
        return issueBeginTime;
    }

    public void setIssueBeginTime(LocalDateTime issueBeginTime) {
        this.issueBeginTime = issueBeginTime;
    }

    public LocalDateTime getIssueEndTime() {
        return issueEndTime;
    }

    public void setIssueEndTime(LocalDateTime issueEndTime) {
        this.issueEndTime = issueEndTime;
    }

    public LocalDateTime getTermBeginTime() {
        return termBeginTime;
    }

    public void setTermBeginTime(LocalDateTime termBeginTime) {
        this.termBeginTime = termBeginTime;
    }

    public LocalDateTime getTermEndTime() {
        return termEndTime;
    }

    public void setTermEndTime(LocalDateTime termEndTime) {
        this.termEndTime = termEndTime;
    }

    public Long getTermDays() {
        return termDays;
    }

    public void setTermDays(Long termDays) {
        this.termDays = termDays;
    }

    @Override
    public String toString() {
        return "CouponIssueFormDTO{" +
                "id"+id+
                "issueBeginTime=" + issueBeginTime +
                ", issueEndTime=" + issueEndTime +
                ", termBeginTime=" + termBeginTime +
                ", termEndTime=" + termEndTime +
                ", termDays=" + termDays +
                '}';
    }
}
