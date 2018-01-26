//
//  RoomShowViewController.swift
//  DYZB
//
//  Created by xiaochen on 2018/1/25.
//

import UIKit
import Hero

private let kAnimationDuration = 0.5

class RoomShowViewController: UIViewController {

    // MARK: 懒加载
    var panGR : UIPanGestureRecognizer!
    var progressBool : Bool = false
    var dismissBool : Bool = true
    
    // MARK: 系统调用
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGray
        
        setupUI()
        setupGes()
    }
}

// MARK:- 设置手势
extension RoomShowViewController {
    fileprivate func setupGes() {
        panGR = UIPanGestureRecognizer(target: self, action: #selector(pan))
        panGR.delegate = self
        view.addGestureRecognizer(panGR)
    }
}

// MARK:- 手势代理方法
extension RoomShowViewController : UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool{
        return true
    }
}


// MARK:- 设置页面
extension RoomShowViewController {
    fileprivate func setupUI() {
        let dismissBtn = UIButton()
        dismissBtn.backgroundColor = .clear
        dismissBtn.frame = CGRect(x: 10, y: 10, width: 60, height: 60)
        dismissBtn.setTitle("Back", for: .normal)
        dismissBtn.setTitleColor(.black, for: .normal)
        dismissBtn.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        view.addSubview(dismissBtn)
    }
}

// MARK:- 页面方法实现
extension RoomShowViewController {
    @objc fileprivate func dismissVC() {
        hero_dismissViewController()
    }
}
