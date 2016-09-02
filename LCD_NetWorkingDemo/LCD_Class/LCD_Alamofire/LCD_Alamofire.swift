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
    
    
    static let noData      = "没有数据！"
    
    
    func alamofire_Net(completion: (AnyObject?,String?, Bool) -> Void) {
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
                        error = returnError(err.code)
                        //error = getError(ErrorCodeType(rawValue: err.code)!)
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
                        error = returnError(err.code)
                        //error = getError(ErrorCodeType(rawValue: err.code)!)
                        print(error)
                        completion(nil,error,isOk)
                    }
            }
            
        }
        
    }
    
    
}
/*
 * 罗列错误类型(自定义)
 */
enum ErrorCodeType:Int {
    case NSURLErrorUnknown = -1
    case NSURLErrorCancelled = -999
    case NSURLErrorBadURL = -1000
    case NSURLErrorTimedOut = -1001
    case NSURLErrorUnsupportedURL = -1002
    case NSURLErrorCannotFindHost = -1003
    case NSURLErrorCannotConnectToHost = -1004
    case NSURLErrorDataLengthExceedsMaximum = -1103
    case NSURLErrorNetworkConnectionLost = -1005
    case NSURLErrorDNSLookupFailed = -1006
    case NSURLErrorHTTPTooManyRedirects = -1007
    case NSURLErrorResourceUnavailable = -1008
    case NSURLErrorNotConnectedToInternet = -1009
    case NSURLErrorRedirectToNonExistentLocation = -1010
    case NSURLErrorBadServerResponse = -1011
    case NSURLErrorUserCancelledAuthentication = -1012
    case NSURLErrorUserAuthenticationRequired = -1013
    case NSURLErrorZeroByteResource = -1014
    case NSURLErrorCannotDecodeRawData = -1015
    case NSURLErrorCannotDecodeContentData = -1016
    case NSURLErrorCannotParseResponse = -1017
    case NSURLErrorFileDoesNotExist = -1100
    case NSURLErrorFileIsDirectory = -1101
    case NSURLErrorNoPermissionsToReadFile = -1102
    case NSURLErrorSecureConnectionFailed = -1200
    case NSURLErrorServerCertificateHasBadDate = -1201
    case NSURLErrorServerCertificateUntrusted = -1202
    case NSURLErrorServerCertificateHasUnknownRoot = -1203
    case NSURLErrorServerCertificateNotYetValid = -1204
    case NSURLErrorClientCertificateRejected = -1205
    case NSURLErrorClientCertificateRequired = -1206
    case NSURLErrorCannotLoadFromNetwork = -2000
    case NSURLErrorCannotCreateFile = -3000
    case NSURLErrorCannotOpenFile = -3001
    case NSURLErrorCannotCloseFile = -3002
    case NSURLErrorCannotWriteToFile = -3003
    case NSURLErrorCannotRemoveFile = -3004
    case NSURLErrorCannotMoveFile = -3005
    case NSURLErrorDownloadDecodingFailedMidStream = -3006
    case NSURLErrorDownloadDecodingFailedToComplete = -3007
}

func getError(error:ErrorCodeType) -> String {
    switch error {
    case .NSURLErrorUnknown:                                 return "未知错误"
    case .NSURLErrorCancelled:                               return "取消了网址"
    case .NSURLErrorBadURL:                                  return "错误URL"
    case .NSURLErrorTimedOut:                                return "请求超时"
    case .NSURLErrorUnsupportedURL:                          return "不支持URL"
    case .NSURLErrorCannotFindHost:                          return "无法找到服务器"
    case .NSURLErrorCannotConnectToHost:                     return "无法连接到服务器"
    case .NSURLErrorDataLengthExceedsMaximum:                return "数据长度超过最大值"
    case .NSURLErrorNetworkConnectionLost:                   return "网络连接丢失"
    case .NSURLErrorDNSLookupFailed:                         return "DNS查找失败"
    case .NSURLErrorHTTPTooManyRedirects:                    return "HTTP重定向"
    case .NSURLErrorResourceUnavailable:                     return "资源不可用"
    case .NSURLErrorNotConnectedToInternet:                  return "没有连接到互联网，请检查网络设置"
    case .NSURLErrorRedirectToNonExistentLocation:           return "重定向到不存在的位置"
    case .NSURLErrorBadServerResponse:                       return "服务器响应错误"
    case .NSURLErrorUserCancelledAuthentication:             return "用户取消认证"
    case .NSURLErrorUserAuthenticationRequired:              return "用户认证要求"
    case .NSURLErrorZeroByteResource:                        return "零字节资源"
    case .NSURLErrorCannotDecodeRawData:                     return "不能解码原始数据"
    case .NSURLErrorCannotDecodeContentData:                 return "无法解码内容数据"
    case .NSURLErrorCannotParseResponse:                     return "无法解析响应"
    case .NSURLErrorFileDoesNotExist:                        return "文件不存在"
    case .NSURLErrorFileIsDirectory:                         return "文件目录错误"
    case .NSURLErrorNoPermissionsToReadFile:                 return "没有权限读取文件"
    case .NSURLErrorSecureConnectionFailed:                  return "安全连接失败"
    case .NSURLErrorServerCertificateHasBadDate:             return "服务器证书已过期"
    case .NSURLErrorServerCertificateUntrusted:              return "服务器证书不可信"
    case .NSURLErrorServerCertificateHasUnknownRoot:         return "服务器证书具有未知的Root"
    case .NSURLErrorServerCertificateNotYetValid:            return "服务器证书无效"
    case .NSURLErrorClientCertificateRejected:               return "客户端证书被拒绝"
    case .NSURLErrorClientCertificateRequired:               return "客户端证书要求"
    case .NSURLErrorCannotLoadFromNetwork:                   return "无法加载网络"
    case .NSURLErrorCannotCreateFile:                        return "无法创建文件"
    case .NSURLErrorCannotOpenFile:                          return "无法打开文件"
    case .NSURLErrorCannotCloseFile:                         return "无法关闭文件"
    case .NSURLErrorCannotWriteToFile:                       return "无法写入文件"
    case .NSURLErrorCannotRemoveFile:                        return "无法删除文件"
    case .NSURLErrorCannotMoveFile:                          return "无法移动文件"
    case .NSURLErrorDownloadDecodingFailedMidStream:         return "下载解码失败"
    case .NSURLErrorDownloadDecodingFailedToComplete:        return "下载解码未能完成"
    
    }
}

/*
 * 罗列错误类型（系统）
 */
func returnError(error:Int) -> String {
    switch error {
    case NSURLErrorUnknown:                                 return "未知错误"
    case NSURLErrorCancelled:                               return "取消了网址"
    case NSURLErrorBadURL:                                  return "错误URL"
    case NSURLErrorTimedOut:                                return "请求超时"
    case NSURLErrorUnsupportedURL:                          return "不支持URL"
    case NSURLErrorCannotFindHost:                          return "无法找到服务器"
    case NSURLErrorCannotConnectToHost:                     return "无法连接到服务器"
    case NSURLErrorDataLengthExceedsMaximum:                return "数据长度超过最大值"
    case NSURLErrorNetworkConnectionLost:                   return "网络连接丢失"
    case NSURLErrorDNSLookupFailed:                         return "DNS查找失败"
    case NSURLErrorHTTPTooManyRedirects:                    return "HTTP重定向"
    case NSURLErrorResourceUnavailable:                     return "资源不可用"
    case NSURLErrorNotConnectedToInternet:                  return "没有连接到互联网，请检查网络设置"
    case NSURLErrorRedirectToNonExistentLocation:           return "重定向到不存在的位置"
    case NSURLErrorBadServerResponse:                       return "服务器响应错误"
    case NSURLErrorUserCancelledAuthentication:             return "用户取消认证"
    case NSURLErrorUserAuthenticationRequired:              return "用户认证要求"
    case NSURLErrorZeroByteResource:                        return "零字节资源"
    case NSURLErrorCannotDecodeRawData:                     return "不能解码原始数据"
    case NSURLErrorCannotDecodeContentData:                 return "无法解码内容数据"
    case NSURLErrorCannotParseResponse:                     return "无法解析响应"
    case NSURLErrorFileDoesNotExist:                        return "文件不存在"
    case NSURLErrorFileIsDirectory:                         return "文件目录错误"
    case NSURLErrorNoPermissionsToReadFile:                 return "没有权限读取文件"
    case NSURLErrorSecureConnectionFailed:                  return "安全连接失败"
    case NSURLErrorServerCertificateHasBadDate:             return "服务器证书已过期"
    case NSURLErrorServerCertificateUntrusted:              return "服务器证书不可信"
    case NSURLErrorServerCertificateHasUnknownRoot:         return "服务器证书具有未知的Root"
    case NSURLErrorServerCertificateNotYetValid:            return "服务器证书无效"
    case NSURLErrorClientCertificateRejected:               return "客户端证书被拒绝"
    case NSURLErrorClientCertificateRequired:               return "客户端证书要求"
    case NSURLErrorCannotLoadFromNetwork:                   return "无法加载网络"
    case NSURLErrorCannotCreateFile:                        return "无法创建文件"
    case NSURLErrorCannotOpenFile:                          return "无法打开文件"
    case NSURLErrorCannotCloseFile:                         return "无法关闭文件"
    case NSURLErrorCannotWriteToFile:                       return "无法写入文件"
    case NSURLErrorCannotRemoveFile:                        return "无法删除文件"
    case NSURLErrorCannotMoveFile:                          return "无法移动文件"
    case NSURLErrorDownloadDecodingFailedMidStream:         return "下载解码失败"
    case NSURLErrorDownloadDecodingFailedToComplete:        return "下载解码未能完成"
    default: return"连接错误！"
    }
}