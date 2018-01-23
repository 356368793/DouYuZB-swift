//
//  GameCollectionHeaderView.swift
//  DYZB
//
//  Created by xiaochen on 2018/1/23.
//

import UIKit

class GameCollectionHeaderView: UICollectionReusableView {

}


extension GameCollectionHeaderView {
    class func headerView() -> GameCollectionHeaderView {
        return Bundle.main.loadNibNamed("GameCollectionHeaderView", owner: nil, options: nil)?.first as! GameCollectionHeaderView
    }
}
