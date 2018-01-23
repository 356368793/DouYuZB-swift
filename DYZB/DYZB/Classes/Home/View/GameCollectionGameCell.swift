//
//  GameCollectionGameCell.swift
//  DYZB
//
//  Created by xiaochen on 2018/1/23.
//

import UIKit

class GameCollectionGameCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconTitle: UILabel!
    
    var gameModel: GameModel? {
        didSet {
            if let url = URL(string: gameModel?.icon_url ?? "") {
                iconImageView.kf.setImage(with: url)
            }
            iconTitle.text = gameModel?.tag_name
        }
    }
}
