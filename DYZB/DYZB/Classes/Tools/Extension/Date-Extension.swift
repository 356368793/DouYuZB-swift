//
//  Date-Extension.swift
//  DYZB
//
//  Created by 小C on 2018/1/13.
//

import Foundation

extension Date {
    static func getCurrentTime() -> String {
        let nowDate = Date()
        
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
    }
}
