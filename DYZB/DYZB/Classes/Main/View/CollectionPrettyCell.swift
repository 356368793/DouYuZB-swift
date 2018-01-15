//
//  CollectionPrettyCell.swift
//  DYZB
//
//  Created by 小C on 2018/1/12.
//

import UIKit
import Kingfisher

class CollectionPrettyCell: CollectionViewBaseCell {

    // MARK:- 控件属性
    @IBOutlet weak var cityLable: UIButton!
    
    // MARK:- 定义模型属性
    override var anchor: AnchorModel? {
        didSet {
            // 1.将属性传递给父类
            super.anchor = anchor
            
            // 2.所在的城市
            cityLable.setTitle(anchor?.anchor_city, for: .normal)
        }
    }
    
}
