//
//  RecommendViewController.swift
//  DYZB
//
//  Created by xiaochen on 2018/1/12.
//

import UIKit

private let kItemMargin: CGFloat = 10
private let kItemW: CGFloat = (kScreenW - (kItemMargin * 3)) / 2
private let kItemH: CGFloat = kItemW * 3 / 4
private let kHeaderW: CGFloat = kScreenW
private let kHeaderH: CGFloat = 50

private let kNormalCellID = "kNormalCellID"
private let kHeaderID = "kHeaderID"

class RecommendViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = { [weak self] in
        // add flowlayout
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = kItemMargin
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        layout.headerReferenceSize = CGSize(width: kHeaderW, height: kHeaderH)
        
        let collectionView = UICollectionView(frame: (self?.view.bounds)!, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderID)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}


extension RecommendViewController {
    private func setupUI() {
        view.addSubview(collectionView)
    }
}


extension RecommendViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath)
        
        item.backgroundColor = UIColor.randomColor()
        
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderID, for: indexPath)
        headerView.backgroundColor = UIColor.lightGray
        
        return headerView
    }
}



