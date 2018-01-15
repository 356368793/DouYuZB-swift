//
//  CollectionNormalCell.swift
//  DYZB
//
//  Created by 小C on 2018/1/12.
//

import UIKit

class CollectionNormalCell: CollectionViewBaseCell {

    // MARK:- 控件的属性
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    
    // MARK:- 定义模型属性
    override var anchor: AnchorModel? {
        didSet {
            // 1.将属性传递给父类
            super.anchor = anchor
            
            // 2.房间名称
            typeLabel.text = anchor?.room_name
        }
    }
}
