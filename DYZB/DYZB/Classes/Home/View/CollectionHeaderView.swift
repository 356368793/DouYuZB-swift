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
    
    var group: AnchorGroup? {
        didSet {
            iconImageView.image = UIImage(named: (group?.icon_name)!)
            iconLabel.text = group?.tag_name
        }
    }
}
