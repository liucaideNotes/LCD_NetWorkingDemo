//
//  LCD_Macros.swift
//  LCD_NetWorkingDemo
//
//  Created by 刘才德 on 16/8/29.
//  Copyright © 2016年 sifenzi. All rights reserved.
//

import Foundation
import UIKit
import Toast

let LCDMainWindow = UIApplication.sharedApplication().delegate!.window!!
///重载运算符 实现两个字典合并为一个字典
func += <KeyType, ValueType> (inout left: Dictionary<KeyType, ValueType>, right: Dictionary<KeyType, ValueType>) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}

