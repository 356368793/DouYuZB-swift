//
//  CollectionHeaderView.swift
//  DYZB
//
//  Created by xiaochen on 2018/1/12.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var moreBtn: UIButton!
    
    var group: AnchorGroup? {
        didSet {
            iconImageView.image = UIImage(named: group?.icon_name ?? "home_header_normal")
            iconLabel.text = group?.tag_name
        }
    }
}

// MARK:- 从Xib中快速创建的类方法
extension CollectionHeaderView {
    class func collectionHeaderView() -> CollectionHeaderView {
        return Bundle.main.loadNibNamed("CollectionHeaderView", owner: nil, options: nil)?.first as! CollectionHeaderView
    }
}
