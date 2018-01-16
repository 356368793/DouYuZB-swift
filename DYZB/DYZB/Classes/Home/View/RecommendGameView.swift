//
//  RecommendGameView.swift
//  DYZB
//
//  Created by xiaochen on 2018/1/16.
//

import UIKit

private let kGameCellID = "kGameCellID"
private let kEdgeInsetMargin : CGFloat = 10

class RecommendGameView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var groups: [AnchorGroup]? {
        didSet {
            groups?.removeFirst()
            groups?.removeFirst()
            
            let other = AnchorGroup()
            other.tag_name = "其他"
            groups?.append(other)
            
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        autoresizingMask = UIViewAutoresizing()
        
        
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        
        // 给collectionView添加内边距
        collectionView.contentInset = UIEdgeInsets(top: 0, left: kEdgeInsetMargin, bottom: 0, right: kEdgeInsetMargin)
    }
}

// MARK:- 提供快速创建的类方法
extension RecommendGameView {
    class func gameView() -> RecommendGameView {
        return Bundle.main.loadNibNamed("RecommendGameView", owner: nil, options: nil)?.first as! RecommendGameView
    }
}

// MARK:- dataSource
extension RecommendGameView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
        
        cell.anchorGroup = groups![indexPath.item]
        
        return cell
    }
}
