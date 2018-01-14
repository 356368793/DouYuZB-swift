//
//  AnchorGroup.swift
//  DYZB
//
//  Created by 小C on 2018/1/14.
//

import UIKit

class AnchorGroup: NSObject {
    // room_list
    @objc var room_list: [[String: NSObject]]? {
        didSet {
            guard let room_list = room_list else { return }
            for anchor in room_list {
                anchors.append(AnchorModel(dict: anchor))
            }
        }
    }
    // tag_name
    @objc var tag_name: String = ""
    // small_icon_url
    @objc var small_icon_url = ""
    // icon_url
    @objc var icon_url = "home_header_normal"
    // tag_id
    @objc var tag_id = ""
    // push_nearby
    @objc var push_nearby = ""
    // push_vertical_screen
    @objc var push_vertical_screen = ""
    
    lazy var anchors: [AnchorModel] = [AnchorModel]()
    
    init(dict: [String: Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("AnchorGroup - undefinedKey = \(key)")
    }
}
