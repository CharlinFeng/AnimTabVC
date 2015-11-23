//
//  AnimTabVC+Custom.swift
//  AnimTabVC
//
//  Created by 冯成林 on 15/11/20.
//  Copyright © 2015年 冯成林. All rights reserved.
//

import UIKit


extension AnimTabVC {

    var width: CGFloat {return size.width / CGFloat(viewControllers!.count)}
    
    override var selectedViewController: UIViewController? {
        
        set{
            super.selectedViewController = newValue
            selectedViewControllerKVO()
        }
        
        get{
            return super.selectedViewController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.backgroundColor = UIColor.redColor()
        backgroundView.frame = CGRectMake(0, 0, width, 49)
        tabBar.insertSubview(backgroundView, atIndex: 0)
       
        selectedViewControllerKVO()
        
        tabBar.barTintColor = UIColor.darkGrayColor()
    }
    
    /** 监听选中控制器事件 */
    func selectedViewControllerKVO(){
        
        let i = selectedIndex
        let x = CGFloat(i) * width + (1-p) * width * 0.5
        let w = width * p
        var frame = backgroundView.bounds
        frame.origin.x = x
        frame.size.width = w

        UIView.animateWithDuration(0.25, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .BeginFromCurrentState , animations: { () -> Void in
            self.backgroundView.frame = frame
        }, completion: nil)
    }
}