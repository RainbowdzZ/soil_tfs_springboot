package com.ruoyi.wx.mapper;

import com.ruoyi.wx.domain.entity.TfsCheckup;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TfsCheckupMapper {
    /**
     * 新增检测单
     * @param tfsCheckup
     * @return
     */

    public int insertTfsCheckup(TfsCheckup tfsCheckup);


    List<TfsCheckup> selectTfsCheckupByOrderId(@Param("orderId") Long orderId);
}
