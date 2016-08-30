//
//  LCD_JustHelper.swift
//  LCD_NetWorkingDemo
//
//  Created by 刘才德 on 16/8/28.
//  Copyright © 2016年 sifenzi. All rights reserved.
//
import SwiftyJSON

/*
 * 使用枚举来区别接口
 */
enum JustHelper {
    ///商家列表
    case GetNearBusiness(parameters: [String:AnyObject])
    case GetDefaultShopProducts(parameters: [String:AnyObject])
    
    ///固定参数，使用static说明为类方法，无需初始化可直接调用，并可将这一存储属性放在枚举中
    static var just_param1: [String:AnyObject] = [
        "pageSize":"20"
    ]
    static var just_param2: [String:AnyObject] = [
        "latitude":"23.119298",
        "longitude":"113.321201",
        "pageSize":"20"
        ]
    
    func getDatas(completion: ([BusinessModel]?, Bool) -> Void) {
        switch self {
        case GetNearBusiness(parameters: var param):
            // 将可变参数添加到参数表中
             param += JustHelper.just_param2
            //执行请求
            JustType.POST(urlString: URL_getNearBusiness, parameters: param).just_Net({ (response, error, isOk) in
                if isOk {
                    let json = JSON(response!)
                    var datas = [BusinessModel]()
                    print(json.dictionary)
                    guard json["head"]["result"] == "0" else{
                        // --- Just 要回到主线程,太麻烦，还是Alamofire好用
                        NSOperationQueue.mainQueue().addOperationWithBlock({
                            LCDMainWindow.makeToast("服务器错误！", duration: 1.0, position: nil)
                            completion(nil,false)
                        })
                        
                        return
                    }
                    guard let array:[JSON] = json["body"]["data"].arrayValue else{
                        NSOperationQueue.mainQueue().addOperationWithBlock({
                            LCDMainWindow.makeToast("没有数据！", duration: 1.0, position: nil)
                            completion(nil,false)
                        })
                        
                        return
                    }
                    for item in array {
                        datas.append(BusinessModel.init(fromJson: item))
                    }
                    NSOperationQueue.mainQueue().addOperationWithBlock({
                        LCDMainWindow.makeToast(error, duration: 1.0, position: nil)
                        completion(datas,true)
                    })
                    
                }else{
                    NSOperationQueue.mainQueue().addOperationWithBlock({
                        LCDMainWindow.makeToast(error, duration: 1.0, position: nil)
                        completion(nil,false)
                    })
                    
                }
            })
            
        case GetDefaultShopProducts(parameters: var param):
            // 将可变参数添加到参数表中
            param += JustHelper.just_param1
            //执行请求
            JustType.POST(urlString: URL_getDefaultShopProducts, parameters: param).just_Net({ (response, error, isOk) in
                
                
            })
        }
    }
    
    
    
}

