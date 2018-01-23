//
//  GameViewController.swift
//  DYZB
//
//  Created by xiaochen on 2018/1/23.
//

import UIKit

private let kEdgeMargin : CGFloat = 10
private let kItemW : CGFloat = (kScreenW - 2 * kEdgeMargin) / 3
private let kItemH : CGFloat = kItemW * 6 / 5
private let kHeaderViewH : CGFloat = 50

private let kGameViewH : CGFloat = 90

private let kGameCellID = "kGameCellID"
private let kHeaderViewID = "kGameHeaderViewID"


class GameViewController: UIViewController {

    // MARK:- 懒加载
    fileprivate lazy var gameVM: GameViewModel = GameViewModel()
    fileprivate lazy var collectionView: UICollectionView = {[unowned self] in
        // 1. 创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: kEdgeMargin, bottom: 0, right: kEdgeMargin)
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        
        // 2. 创建 UICollectionView
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.register(UINib(nibName: "GameCollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        collectionView.register(UINib(nibName: "GameCollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        collectionView.dataSource = self
        
        return collectionView
    }()
    fileprivate lazy var topHeaderView : GameCollectionHeaderView = {
        let headerView = GameCollectionHeaderView.headerView()
        headerView.frame = CGRect(x: 0, y: -(kHeaderViewH + kGameViewH), width: kScreenW, height: kHeaderViewH)
        return headerView
    }()
    
    // MARK:- 系统调用
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadData()
    }
}

// MARK:- 设置UI界面
extension GameViewController {
    func setupUI() {
        // 0.给ContentView进行赋值
//        contentView = collectionView
        
        // 1.添加UICollectionView
        view.addSubview(collectionView)
        
        // 2.添加顶部的HeaderView
        collectionView.addSubview(topHeaderView)
//
//        // 3.将常用游戏的View,添加到collectionView中
//        collectionView.addSubview(gameView)
        
        // 设置collectionView的内边距
//        collectionView.contentInset = UIEdgeInsets(top: kHeaderViewH + kGameViewH, left: 0, bottom: 0, right: 0)
        
//        super.setupUI()
    }
}

// MARK:- 请求数据
extension GameViewController {
    fileprivate func loadData() {
        gameVM.loadAllGameData {
            self.collectionView.reloadData()
        }
    }
}

// MARK:- 遵守UICollectionView的数据源&代理
extension GameViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameVM.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 1.获取cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! GameCollectionGameCell
        
        let gameModel = gameVM.games[indexPath.item]
        cell.gameModel = gameModel
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 1.取出HeaderView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! GameCollectionHeaderView
        
        // 2.给HeaderView设置属性
//        headerView.titleLabel.text = "全部"
//        headerView.iconImageView.image = UIImage(named: "Img_orange")
//        headerView.moreBtn.isHidden = true
        
        return headerView
    }
    
}



