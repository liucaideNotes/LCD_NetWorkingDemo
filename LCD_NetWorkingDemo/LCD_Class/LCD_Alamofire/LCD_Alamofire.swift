//
//  LCD_Alamofire.swift
//  LCD_NetWorkingDemo
//
//  Created by 刘才德 on 16/8/29.
//  Copyright © 2016年 sifenzi. All rights reserved.
//

/*
 * 使用Alamofire库进行网络请求
 */
import Alamofire
/*
 * 使用枚举来区别请求类型
 */
enum AlamofireType {
    
    case GET(urlString: String, parameters: [String:AnyObject])
    case POST(urlString: String, parameters: [String:AnyObject])
    
    static let netError    = "数据加载失败!\n可能是网络信号差或没有连接网络"
    static let serverError = "无法连接到服务器"
    static let noData      = "没有数据！"
    static let noUrl       = "连接错误！"
    
    func just_Net(completion: (AnyObject?,String?, Bool) -> Void) {
        var error = ""
        var isOk = false
        switch self {
        case GET(urlString: let url, parameters: let param):
            //执行请求
            Alamofire.request(.GET, url, parameters: param)
                .responseJSON { response in
                    let result = response.result
                    switch result {
                    case .Success(let json):
                        if (response.result.value != nil) {
                            isOk = true
                                // 返回成功数据
                        } else{
                            error = AlamofireType.noData
                        }
                        completion(json,error,isOk)
                    case .Failure(let err):
                        isOk = false
                        if      err.code == -1009 {
                            error = AlamofireType.netError
                        }
                        else if err.code == -1004 {
                            error = AlamofireType.serverError
                        }
                        else if err.code ==  3840 {
                            error = AlamofireType.noUrl
                        }
                        else{
                            error = AlamofireType.noData
                        }
                        completion(nil,error,isOk)
                    }
                    
            }
        case POST(urlString: let url, parameters: let param):
            Alamofire.request(.POST, url, parameters: param)
                .responseJSON { response in
                    let result = response.result
                    switch result {
                    case .Success(let json):
                        if (response.result.value != nil) {
                            isOk = true
                            // 返回成功数据
                        } else{
                            error = AlamofireType.noData
                        }
                        completion(json,error,isOk)
                    case .Failure(let err):
                        isOk = false
                        if      err.code == -1009 {
                            error = AlamofireType.netError
                        }
                        else if err.code == -1004 {
                            error = AlamofireType.serverError
                        }
                        else if err.code ==  3840 {
                            error = AlamofireType.noUrl
                        }
                        else{
                            error = AlamofireType.noData
                        }
                        completion(nil,error,isOk)
                    }
            }
            
        }
        
    }
    
}



