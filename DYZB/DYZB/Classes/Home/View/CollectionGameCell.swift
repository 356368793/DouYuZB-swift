//
//  CollectionGameCell.swift
//  DYZB
//
//  Created by xiaochen on 2018/1/16.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconLabel: UILabel!
    
    var anchorGroup: AnchorGroup? {
        didSet {
            iconLabel.text = anchorGroup?.tag_name
            
            if let iconUrl = URL(string: anchorGroup?.icon_url ?? "") {
                iconImageView.kf.setImage(with: iconUrl)
            } else {
                iconImageView.image = UIImage(named: "home_more_btn")
            }
        }
    }

}
