//
//  RecommendViewController.swift
//  DYZB
//
//  Created by xiaochen on 2018/1/12.
//

import UIKit

private let kItemMargin: CGFloat = 10
private let kItemW: CGFloat = (kScreenW - (kItemMargin * 3)) / 2
private let kNoremalItemH: CGFloat = kItemW * 3 / 4
private let kPrettyItemH: CGFloat = kItemW * 4 / 3
private let kHeaderW: CGFloat = kScreenW
private let kHeaderH: CGFloat = 50

private let kNormalCellID = "kNormalCellID"
private let kPrettyCellID = "kPrettyCellID"
private let kHeaderID = "kHeaderID"

private let kCycleViewH: CGFloat = kScreenW * 3 / 8
private let kGameViewH: CGFloat = 90

class RecommendViewController: UIViewController {
    
    // MARK:- lazy initialization
    private lazy var recommendVM: RecommendViewModel = RecommendViewModel()
    private lazy var dataGroups: [AnchorGroup] = [AnchorGroup]()
    
    private lazy var collectionView: UICollectionView = { [weak self] in
        // add flowlayout
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = kItemMargin
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: kItemW, height: kNoremalItemH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        layout.headerReferenceSize = CGSize(width: kHeaderW, height: kHeaderH)
        
        let collectionView = UICollectionView(frame: (self?.view.bounds)!, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderID)
        collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UINib(nibName: "CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    private lazy var cycleView: RecommendCycleView = {
        let cycleView = RecommendCycleView.cycleView()
        cycleView.frame = CGRect(x: 0, y: -(kCycleViewH + kGameViewH), width: kScreenW, height: kCycleViewH)
        return cycleView
    }()
    private lazy var gameView: RecommendGameView = {
        let gameView = RecommendGameView.gameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        return gameView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        requestData()
    }
}


extension RecommendViewController {
    private func setupUI() {
        view.addSubview(collectionView)
        
        // 将CycleView添加到UICollectionView中
        collectionView.addSubview(cycleView)
        // 将 gameView 添加到 UICollectionView 中
        collectionView.addSubview(gameView)
        
        // 设置 collectionView 内边距
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewH + kGameViewH, left: 0, bottom: 0, right: 0)
    }
}

extension RecommendViewController {
     func requestData() {
        recommendVM.requestData {
            self.dataGroups = self.recommendVM.anchorGroups
            self.gameView.groups = self.dataGroups
            
            self.collectionView.reloadData()
        }
        
        recommendVM.requestCycleData {
            self.cycleView.cycleModels = self.recommendVM.cycleModels
        }
    }
}

extension RecommendViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.dataGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataGroups[section].anchors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let group = self.dataGroups[indexPath.section]
        let anchor = group.anchors[indexPath.row]
        
        var cell: CollectionViewBaseCell!
        
        if indexPath.section == 1 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! CollectionPrettyCell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! CollectionNormalCell
        }
        
        cell.anchor = anchor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderID, for: indexPath) as! CollectionHeaderView
        
        headerView.group = self.dataGroups[indexPath.section]
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kItemW, height: kPrettyItemH)
        }
        return CGSize(width: kItemW, height: kNoremalItemH)
    }
}



