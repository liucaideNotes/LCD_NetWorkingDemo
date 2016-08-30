//
//  ShopMallDetailModel.swift
//  IEXBUY
//
//  Created by 刘才德 on 16/8/3.
//  Copyright © 2016年 IEXBUY. All rights reserved.
//

import Foundation

import SwiftyJSON

struct BusinessModel {
    /// 活动
    var ihg_activity : String = ""
    /// 地址
    var ihg_address : String = ""
    /// 商圈
    var ihg_area : String = ""
    /// 商家品牌
    var ihg_businessBrand : String = ""
    /// 地图-富文本
    var ihg_businessMap : String = ""
    /// 类别
    var ihg_category : [BusinessTypeModel] = [BusinessTypeModel]()
    /// 城市编码
    var ihg_city : String = ""
    /// 描述1
    var ihg_description1 : String = ""
    /// 描述2
    var ihg_description2 : String = ""
    /// 详情描述
    var ihg_detail : String = ""
    /// 距离
    var ihg_distance : Float = 0.0
    /// 区域
    var ihg_district : String = ""
    /// ID
    var ihg_id : String = ""
    /// 坐标
    var ihg_latitude : String = ""
    /// 坐标
    var ihg_longitude : String = ""
    /// 楼层图
    var ihg_mallMap : String = ""
    /// 购物中心名称
    var ihg_mallName : String = ""
    /// 广场标题
    var ihg_mallTitle : String = ""
    /// 广场类型
    var ihg_mallType : String = ""
    ///
    var ihg_number : Int = 0
    /// 省份
    var ihg_province : String = ""
    /// 图片
    var ihg_thumbnailurl : String = ""
    ///
    var ihg_totalShop : Int = 0
    ///
    var ihg_unitePay : String = ""
    
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json == nil{
            return
        }
        ihg_activity = json["activity"].stringValue
        ihg_address = json["address"].stringValue
        ihg_area = json["area"].stringValue
        ihg_businessBrand = json["businessBrand"].stringValue
        ihg_businessMap = json["businessMap"].stringValue
        ihg_city = json["city"].stringValue
        ihg_description1 = json["description"].stringValue
        ihg_description2 = json["description2"].stringValue
        ihg_detail = json["detail"].stringValue
        ihg_distance = json["distance"].floatValue
        ihg_district = json["district"].stringValue
        ihg_id = json["id"].stringValue
        ihg_latitude = json["latitude"].stringValue
        ihg_longitude = json["longitude"].stringValue
        ihg_mallMap = json["mallMap"].stringValue
        ihg_mallName = json["mallName"].stringValue
        ihg_mallTitle = json["mallTitle"].stringValue
        ihg_mallType = json["mallType"].stringValue
        ihg_number = json["number"].intValue
        ihg_province = json["province"].stringValue
        ihg_thumbnailurl = json["thumbnailurl"].stringValue
        ihg_totalShop = json["totalShop"].intValue
        ihg_unitePay = json["unitePay"].stringValue
        
        let itemsArray = json["category"].arrayValue
        for itemsJson in itemsArray{
            let value = BusinessTypeModel(fromJson: itemsJson)
            ihg_category.append(value)
        }
    }

    
    init(){}
}