//
//  AnchorModel.swift
//  DYZB
//
//  Created by 小C on 2018/1/14.
//

import UIKit

class AnchorModel: NSObject {
    @objc var avatar_mid = ""
    @objc var avatar_small = ""
    @objc var cate_id: Int = 0
    @objc var game_name = ""
    @objc var hn: Int = 0
    @objc var isVertical: Int = 0
    @objc var jumpUrl = ""
    @objc var nickname = ""
    @objc var online: Int = 0
    @objc var owner_uid: Int = 0
    @objc var ranktype: Int = 0
    @objc var rmf1: Int = 0
    @objc var rmf2: Int = 0
    @objc var room_id: Int = 0
    @objc var room_name = ""
    @objc var room_src = ""
    @objc var show_status: Int = 0
    @objc var show_time: Int = 0
    @objc var specific_catalog = ""
    @objc var specific_status: Int = 0
    @objc var vertical_src = ""
    
    init(dict: [String: NSObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("AnchorModel - undefinedKey = \(key)")
    }
}

