
//
//   UIBarButtonItem-Extension.swift
//  TVOO
//
//  Created by m on 2017/2/28.
//  Copyright © 2017年 XLJ. All rights reserved.
//

import UIKit

//MARK:-设置BarItem
extension UIBarButtonItem {
    /*
    class func createItem(imageName: String, hightImageName: String, size: CGSize) -> UIBarButtonItem{
        
        let btn = UIButton()
        
        btn.setImage(UIImage.init(named: imageName), for: .normal)
        btn.setImage(UIImage.init(named: hightImageName), for: .highlighted)
        
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        
        return UIBarButtonItem(customView: btn)
    }
    */
    
    //使用构造函数,便利构造函数convenience,设计构造函数:self.init(customView: btn)
    convenience init(imageName: String, hightImageName : String = "", size: CGSize = CGSize.zero) {
        //1.创建按钮
        let btn = UIButton()
        //2.设置Item的图片
        btn.setImage(UIImage.init(named: imageName), for: .normal)
        if hightImageName != "" {
            btn.setImage(UIImage.init(named: hightImageName), for: .highlighted)
        }
        //3.设置item的尺寸
        if size == CGSize.zero {
            btn.sizeToFit()
        }else{
            btn.frame = CGRect(origin: CGPoint.zero, size: size)

        }
        //4.创建Item
         self.init(customView: btn)

    }
}
