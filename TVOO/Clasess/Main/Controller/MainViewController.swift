//
//  MainViewController.swift
//  TVOO
//
//  Created by m on 2017/2/28.
//  Copyright © 2017年 XLJ. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController(name: "Home")
        addChildViewController(name: "Live")
        addChildViewController(name: "Follow")
        addChildViewController(name: "Profile")
    }
    
    //添加子视图
    private func addChildViewController(name : String){
        //1.获取到控制器
        let childVC = UIStoryboard(name: name, bundle: nil).instantiateInitialViewController()!
        //2.将子视图添加到控制器
        addChildViewController(childVC)

    }

    
}
