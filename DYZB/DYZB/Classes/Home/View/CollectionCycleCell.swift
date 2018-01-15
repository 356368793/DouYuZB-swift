//
//  CollectionCycleCell.swift
//  DYZB
//
//  Created by xiaochen on 2018/1/15.
//

import UIKit

class CollectionCycleCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    @objc var cycleModel: CycleModel? {
        didSet {
            guard let iconUrl = URL(string: (cycleModel?.pic_url)!) else { return }
            iconImageView.kf.setImage(with: iconUrl)
            
            titleLabel.text = cycleModel?.title
        }
    }
}
