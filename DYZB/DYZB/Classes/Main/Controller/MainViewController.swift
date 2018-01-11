//
//  MainViewController.swift
//  DYZB
//
//  Created by xiaochen on 2018/1/11.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVc("Home")
        addChildVc("Live")
        addChildVc("Follow")
        addChildVc("Profile")
    }
    
    private func addChildVc(_ storyName: String) {
        // 1. 通过 storyboard 获取控制器
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        
        // 2. 将 childVc 添加为子控制器
        addChildViewController(childVc)
    }
}
