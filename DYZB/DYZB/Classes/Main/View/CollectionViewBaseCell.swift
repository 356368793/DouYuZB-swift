//
//  CollectionViewBaseCell.swift
//  DYZB
//
//  Created by xiaochen on 2018/1/15.
//

import UIKit

class CollectionViewBaseCell: UICollectionViewCell {
    // MARK:- define property
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK:- 定义模型
    var anchor: AnchorModel? {
        didSet {
            // 0.校验模型是否有值
            guard let anchor = anchor else { return }
            
            // 1.取出在线人数显示的文字
            var onlineStr = ""
            if anchor.online >= 10000 {
                onlineStr = "\(Int(anchor.online / 10000))万在线"
            } else {
                onlineStr = "\(anchor.online)在线"
            }
            onlineBtn.setTitle(onlineStr, for: .normal)
            
            // 2.昵称的显示
            nameLabel.text = anchor.nickname
            
            // 3.设置封面图片
            guard let iconURL = URL(string: anchor.vertical_src) else { return }
            imageView.kf.setImage(with: iconURL)
        }
    }
}
