//
//  MXPageTitleView.swift
//  TVOO
//
//  Created by m on 2017/2/28.
//  Copyright © 2017年 XLJ. All rights reserved.
//

import UIKit

let mScrollLineH: CGFloat = 2

class MXPageTitleView: UIView {

    //MARK: - 自定义属性
    var titles: [String]
    
    //MARK: - 懒加载 
    fileprivate lazy var titleLables: [UILabel] = [UILabel]()
    fileprivate lazy var scrollView: UIScrollView = {
       
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
    
        return scrollView
    }()
    
    fileprivate lazy var scrollLine: UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    
    
    //MARK:- 自定义构造函数
     init(frame: CGRect, titles: [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been impleate")
    }
}

//MARK: -设置界面
extension MXPageTitleView {
    fileprivate func setupUI(){
        //1.添加懒加载
        addSubview(scrollView)
        scrollView.frame = bounds
        
        //2.添加title对应的lable
        setupTitleLables()
        
        //4.设置底线和滚动的滑块
        setupBottomLineAndScrollLine()
    }
    
    fileprivate func setupTitleLables() {
        
        let lableW: CGFloat = frame.width / CGFloat(titles.count)
        let lableH: CGFloat = frame.height - mScrollLineH
        let lableY: CGFloat = 0

        
        for (index, title) in titles.enumerated(){
            //1.创建UILable
            let lable = UILabel()
            
            //2.设置labe的属性
            lable.text = title
            lable.tag = index
            lable.font = UIFont.systemFont(ofSize: 16)
            lable.textColor = UIColor.darkGray
            lable.textAlignment = .center
            
            //3.设置frame

            let lableX: CGFloat = lableW * CGFloat(index)
            
            lable.frame = CGRect(x: lableX, y: lableY, width: lableW, height: lableH)
            
            //4.将lable添加到scrollView中
            scrollView.addSubview(lable)
            titleLables.append(lable)
            
        }
    }

    fileprivate func setupBottomLineAndScrollLine() {
        
        //1.添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        
        let lineH: CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        
        addSubview(bottomLine)
        
        //2.添加scrollLine
        scrollView.addSubview(scrollLine)
        //获取lable的x
        guard let firstLable = titleLables.first else {return }
        firstLable.textColor = UIColor.orange
        scrollLine.frame = CGRect(x: firstLable.frame.origin.x, y: frame.height - mScrollLineH, width: firstLable.frame.width, height: mScrollLineH)
    }
}
