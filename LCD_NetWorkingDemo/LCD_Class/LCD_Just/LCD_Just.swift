//
//  LCD_Just.swift
//  LCD_NetWorkingDemo
//
//  Created by 刘才德 on 16/8/27.
//  Copyright © 2016年 sifenzi. All rights reserved.
//

/*
 * 使用Just库进行网络请求
 */
import Just
/*
 * 使用枚举来区别请求类型
 */
enum JustType {
    
    case GET(urlString: String, parameters: [String:AnyObject])
    case POST(urlString: String, parameters: [String:AnyObject])
    
    
    func just_Net(completion: (AnyObject?,String?, Bool) -> Void) {
        var error: String?
        var isOk = false
        var results: AnyObject?
        switch self {
        case GET(urlString: let url, parameters: let param):
            //执行请求
            Just.get(url, params: param,  asyncCompletionHandler: { (r) in
                if r.ok {
                    //确保返回结果是一个json,并可转换为一个字典
                    guard let jsonDict = r.json as? [String:AnyObject] else {
                        error = "数据错误！"
                        isOk = false
                        return
                    }
                    isOk = true
                    results = jsonDict
                }else{
                    isOk = false
                    error = "服务器出错！"
                }
                completion(results, error, isOk)
            })
        case POST(urlString: let url, parameters: let param):
            //执行请求
            Just.post(url, params: param, asyncCompletionHandler: { (r) in
                if r.ok {
                    //确保返回结果是一个json,并可转换为一个字典
                    guard let jsonDict = r.json as? [String:AnyObject] else {
                        error = "数据错误！"
                        isOk = false
                        return
                    }
                    isOk = true
                    results = jsonDict
                }else{
                    isOk = false
                    error = "服务器出错！"
                }
                completion(results, error, isOk)
            })
        
        }
        
    }
    
}


