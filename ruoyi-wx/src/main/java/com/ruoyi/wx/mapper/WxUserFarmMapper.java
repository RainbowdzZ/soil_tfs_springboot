package com.ruoyi.wx.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.wx.domain.entity.WxUserFarm;
import org.apache.ibatis.annotations.Update;

/**
 * 农场管理Mapper接口
 * 
 * @author xqb
 * @date 2023-11-08
 */
public interface WxUserFarmMapper extends BaseMapper<WxUserFarm>
{
    /**
     * 查询农场管理
     * 
     * @param id 农场管理主键
     * @return 农场管理
     */
    public WxUserFarm selectWxUserFarmById(Long id);

    /**
     * 查询农场管理列表
     * 
     * @param wxUserFarm 农场管理
     * @return 农场管理集合
     */
    public List<WxUserFarm> selectWxUserFarmList(WxUserFarm wxUserFarm);

    /**
     * 新增农场管理
     * 
     * @param wxUserFarm 农场管理
     * @return 结果
     */
    public int insertWxUserFarm(WxUserFarm wxUserFarm);

    /**
     * 修改农场管理
     * 
     * @param wxUserFarm 农场管理
     * @return 结果
     */
    public int updateWxUserFarm(WxUserFarm wxUserFarm);

    /**
     * 删除农场管理
     * 
     * @param id 农场管理主键
     * @return 结果
     */
    public int deleteWxUserFarmById(Long id);

    /**
     * 批量删除农场管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWxUserFarmByIds(Long[] ids);

    @Update("update wx_user_farm set is_default = 0 where user_id = #{userId}")
    void updateStatusByUserId(Long userId);

    @Update("update wx_user_farm set is_default = 1 where id = #{farmId}")
    void updateStatusById(Long farmId);
}
