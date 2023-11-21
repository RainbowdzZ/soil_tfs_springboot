package com.ruoyi.wx.domain.dto;

import com.ruoyi.wx.domain.entity.TfsOrder;
import lombok.Data;

@Data
public class TfsOrderDto extends TfsOrder {
    // 额外的信息
    private String consignee;
    private String phone;
}
