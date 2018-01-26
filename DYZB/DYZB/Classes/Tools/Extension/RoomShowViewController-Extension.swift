//
//  RoomShowViewController-Extension.swift
//  DYZB
//
//  Created by xiaochen on 2018/1/26.
//

import UIKit
import Hero

extension RoomShowViewController {
    @objc func pan(recognizer : UIPanGestureRecognizer){
        //1. Monitor the translation of view
        let translation = recognizer.translation(in: nil)
        let progressY = (translation.y / 2 ) / view.bounds.height
        
        if recognizer.direction == .down {
            if(dismissBool){
                dismissBool = false
                hero_dismissViewController()
                self.heroModalAnimationType = .uncover(direction: .down)
                progressBool = true
                recognizer.setTranslation(.zero, in: view)
            }
        }
        
        //3. Gesture states
        switch recognizer.state {
        //3.1 Gesture states began to check the pan direction the user initiated
        case .began:
            // MARK:- 滑动
            print("began")
        //3.2 Gesture state changed to Translate the view according to the user pan gesture
        case .changed:
            if(progressBool){
                let currentPos = CGPoint(x: view.center.x , y: translation.y + view.center.y)
                Hero.shared.update(progressY)
                Hero.shared.apply(modifiers: [.position(currentPos)], to: view)
            }
        //3.3 Gesture state end to finish the animation
        default:
            dismissBool = true
            progressBool = false
            if fabs(progressY + recognizer.velocity(in: nil).y / view.bounds.height ) > 0.5 {
                Hero.shared.finish()
            } else {
                Hero.shared.cancel()
            }
        }
    }
}
