//
//  BusinessTypeModel.swift
//  iexbuy
//
//  Created by sifenzi on 16/4/20.
//  Copyright © 2016年 IEXBUY. All rights reserved.
//

import UIKit
import SwiftyJSON
struct BusinessTypeModel {
    
    var ihg_code = "" //
    var ihg_thumbnailUrl = "" //
    var ihg_name = "" //
    
    init(){}
    /**
     * 用字典来初始化一个实例并设置各个属性值
     */
    init(dict:[String:AnyObject]) {
        ihg_code = dict["code"] as? String ?? ""
        ihg_thumbnailUrl = dict["name"] as? String ?? ""
        ihg_name = dict["thumbnailUrl"] as? String ?? ""
    }
    
    
    init(fromJson json: JSON!){
        if json == nil{
            return
        }
        ihg_code = json["code"].stringValue
        ihg_name = json["name"].stringValue
        ihg_thumbnailUrl = json["thumbnailUrl"].stringValue
    }


}
