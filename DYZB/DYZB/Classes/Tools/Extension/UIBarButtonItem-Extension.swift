//
//  UIBarButtonItem-Extension.swift
//  DYZB
//
//  Created by xiaochen on 2018/1/11.
//

import UIKit

extension UIBarButtonItem {
    /*
     class func createItem(imageName : String, highImageName : String, size : CGSize) -> UIBarButtonItem {
     let btn = UIButton()
     
     btn.setImage(UIImage(named: imageName), forState: .Normal)
     btn.setImage(UIImage(named: highImageName), forState: .Highlighted)
     
     btn.frame = CGRect(origin: CGPointZero, size: size)
     
     return UIBarButtonItem(customView: btn)
     }
     */
    
    // 便利构造函数: 1> convenience开头 2> 在构造函数中必须明确调用一个设计的构造函数(self)
    convenience init(imageName: String, highImageName: String = "", size: CGSize = CGSize.zero) {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        if size == CGSize.zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        self.init(customView: btn)
    }
}
