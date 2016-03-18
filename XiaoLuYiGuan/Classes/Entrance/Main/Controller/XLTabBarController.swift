//
//  XLTabBarController.swift
//  XiaoLuYiGuan
//
//  Created by DaysSummer on 16/3/17.
//  Copyright © 2016年 SayDy. All rights reserved.
//

import UIKit

class XLTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewControllers()
    }
    
    private func addChildViewControllers() {
        useTabbar.frame = tabBar.frame
        useTabbar.selectController({ (index) -> () in
            self.selectedIndex = index
            print(index)
        })
        view.addSubview(useTabbar)
        tabBar.removeFromSuperview()
        
        addChildViewController(XLHomeViewController(style: .Grouped) ,tabbarImageName: "ic_home" ,tabbarSelectImageName: "ic_home_hl")
        addChildViewController(XLMessageViewController(), tabbarImageName: "ic_message" ,tabbarSelectImageName: "ic_message_hl")
        addChildViewController(XLMeViewController(), tabbarImageName: "ic_me" ,tabbarSelectImageName: "ic_me_hl")
    }
    
    private func addChildViewController(childController: UIViewController ,tabbarImageName: String ,tabbarSelectImageName: String) {
        useTabbar.addButton(UIImage(named: tabbarImageName), selectImage: UIImage(named: tabbarSelectImageName))
        let onNavigationController = UINavigationController(rootViewController: childController)
        addChildViewController(onNavigationController)
        self.tabBar
    }

    
    private lazy var useTabbar: XLTabbarView = XLTabbarView()

    
    
}
