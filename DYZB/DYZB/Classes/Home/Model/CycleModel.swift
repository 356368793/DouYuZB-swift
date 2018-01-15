//
//  CycleModel.swift
//  DYZB
//
//  Created by xiaochen on 2018/1/15.
//

import UIKit

class CycleModel: NSObject {
    // 标题
    @objc var title : String = ""
    // 展示的图片地址
    @objc var pic_url : String = ""
    // 主播信息对应的字典
    @objc var room: [String: NSObject]? {
        didSet {
            guard let room = room else { return }
            anchor = AnchorModel(dict: room)
        }
    }
    
    // 主播对应的信息模型
    @objc var anchor: AnchorModel?
    
    init(dict: [String: NSObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
