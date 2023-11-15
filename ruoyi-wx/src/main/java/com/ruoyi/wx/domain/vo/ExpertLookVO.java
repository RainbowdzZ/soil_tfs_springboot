package com.ruoyi.wx.domain.vo;

import com.ruoyi.wx.domain.entity.TfsCheckup;

import java.util.List;

public class ExpertLookVO {

    private String plantCategory;

    private String scale;

    private String soilUrl;

    private String address;

    private List<TfsCheckup> tfsCheckupList;

    public List<TfsCheckup> getTfsCheckupList() {
        return tfsCheckupList;
    }

    public void setTfsCheckupList(List<TfsCheckup> tfsCheckupList) {
        this.tfsCheckupList = tfsCheckupList;
    }

    public String getPlantCategory() {
        return plantCategory;
    }

    public void setPlantCategory(String plantCategory) {
        this.plantCategory = plantCategory;
    }

    public String getScale() {
        return scale;
    }

    public void setScale(String scale) {
        this.scale = scale;
    }

    public String getSoilUrl() {
        return soilUrl;
    }

    public void setSoilUrl(String soilUrl) {
        this.soilUrl = soilUrl;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
