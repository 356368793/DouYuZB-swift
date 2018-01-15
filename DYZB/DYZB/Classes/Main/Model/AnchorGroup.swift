//
//  AnchorGroup.swift
//  DYZB
//
//  Created by 小C on 2018/1/14.
//

import UIKit

class AnchorGroup: BaseGameModel {
    /// 该组中对应的房间信息
    @objc var room_list: [[String: NSObject]]? {
        didSet {
            guard let room_list = room_list else { return }
            for anchor in room_list {
                anchors.append(AnchorModel(dict: anchor))
            }
        }
    }
    /// 组显示的图标
    @objc var icon_name : String = "home_header_normal"
    /// 定义主播的模型对象数组
    lazy var anchors : [AnchorModel] = [AnchorModel]()
}
