//
//  ViewController.swift
//  LCD_NetWorkingDemo
//
//  Created by 刘才德 on 16/8/27.
//  Copyright © 2016年 sifenzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // --- 使用Alamofire进行请求  Alamofire 更加好用
        let al_one = LCD_AlamofireHelper.GetNearBusiness(parameters: ["cityCode":"440100","district":"","pageNo":0])
        al_one.getDatas { (datas, isOk) in
            
            print(datas)
        }
        // --- 使用Just进行请求
        let ju_one = JustHelper.GetNearBusiness(parameters: ["cityCode":"440100","district":"","pageNo":0])
        ju_one.getDatas { (datas, isOk) in
            if isOk {
                LCDMainWindow.makeToast("OKOKOKOKOKOKO")
            }
        
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

