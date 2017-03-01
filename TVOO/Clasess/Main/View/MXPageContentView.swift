//
//  MXPageContentView.swift
//  TVOO
//
//  Created by m on 2017/2/28.
//  Copyright © 2017年 XLJ. All rights reserved.
//

import UIKit

class MXPageContentView: UIView {

    //MARK: - 自定义属性
    fileprivate var childVcs: [UIViewController]
    fileprivate var parentViewController: UIViewController
    
    //MARK: - 自定义构造函数
    init(frame: CGRect, childVcs: [UIViewController], parentViewController: UIViewController) {
        
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been impleate")
    }
}
