//
//  HomeViewController.swift
//  TVOO
//
//  Created by m on 2017/2/28.
//  Copyright © 2017年 XLJ. All rights reserved.
//

import UIKit

private let mTitleViwH: CGFloat = 40

class HomeViewController: UIViewController {

    //MARK: - 懒加载
    fileprivate lazy var pageTitleView: MXPageTitleView = {
        let titleFrmae = CGRect(x: 0, y: mStatusBarH+mNavigationBarH, width: mScreenW, height: mTitleViwH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = MXPageTitleView(frame: titleFrmae, titles: titles)
//        titleView.backgroundColor = UIColor.red
        return titleView
    }()
    
    fileprivate lazy var pageContenView: MXPageContentView = {
        //1.确定内容的frame
        let contentH = mScreenH - mStatusBarH - mNavigationBarH - mTitleViwH
        let contentFrame = CGRect(x: 0, y: mStatusBarH + mNavigationBarH + mTitleViwH, width: mScreenW, height: contentH)
        
        //2.确定所有的子控制器
        var childVcs = [UIViewController]()
        
        for _ in 0..<4 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        let contentView = MXPageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }


}

//MARK:- 设置UI界面
extension HomeViewController {
    fileprivate func setupUI(){
        automaticallyAdjustsScrollViewInsets = false
        //1.设置导航栏
        setupNavigationBar()
        
        //2.添加titleView
        view.addSubview(pageTitleView)
        
        //3.添加contenView
        view.addSubview(pageContenView)
        pageContenView.backgroundColor = UIColor.purple
    }
    
    private func setupNavigationBar() {
        //1.设置左侧的Item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        //2.设置右侧的Items
        let size = CGSize(width: 40, height: 40)
        //下面的代码已被抽取封装了
        let historyItem = UIBarButtonItem.init(imageName: "image_my_history", hightImageName: "image_my_history_click", size: size)
        
        let searchItem =  UIBarButtonItem.init(imageName: "btn_search", hightImageName: "btn_search_clicked", size: size)
        
        let qrcodetem = UIBarButtonItem.init(imageName: "Image_scan", hightImageName: "Image_scan", size: size)

        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodetem]
    }
}
