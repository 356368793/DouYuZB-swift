//
//  RecommendCycleView.swift
//  DYZB
//
//  Created by xiaochen on 2018/1/15.
//

import UIKit

private let kCycleViewCellID = "kCycleViewCellID"

class RecommendCycleView: UIView {
    
    // MARK:- 定义属性
    var cycleTimer: Timer?
    @objc var cycleModels : [CycleModel]? {
        didSet {
            // 1.刷新collectionView
            collectionView.reloadData()
            
            // 2.设置pageControl个数
            pageControl.numberOfPages = cycleModels?.count ?? 0
            
            // 3.默认滚动到中间某一个位置
            let indexPath = IndexPath(item: (cycleModels?.count ?? 0) * 100, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
            
            // 4.添加定时器
            removeCycleTimer()
            addCycleTimer()
        }
    }
    
    // MARK:- 控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: 系统回调函数
    override func awakeFromNib() {
        super.awakeFromNib()
        
        autoresizingMask = UIViewAutoresizing()
        
        // MARK:- 注册 cell
        collectionView.register(UINib(nibName: "CollectionCycleCell", bundle: nil), forCellWithReuseIdentifier: kCycleViewCellID)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // MARK:- 布局相关组件
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
    }
}

// MARK:- 提供一个快速创建View的类方法
extension RecommendCycleView {
    class func cycleView() -> RecommendCycleView {
        return Bundle.main.loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
    }
}

// MARK:- 遵守UICollectionView的数据源协议
extension RecommendCycleView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (cycleModels?.count ?? 0) * 10000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCycleViewCellID, for: indexPath) as! CollectionCycleCell
        
        
        cell.cycleModel = cycleModels?[indexPath.row % (cycleModels?.count ?? 1)!]
        
        return cell
    }
}

// MARK:- 遵守UICollectionView的代理协议
extension RecommendCycleView: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        let currentPage = Int(offsetX / scrollView.bounds.width) % (cycleModels?.count ?? 1)
        pageControl.currentPage = currentPage
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeCycleTimer()
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addCycleTimer()
    }
}

// MARK:- 对定时器的操作方法
extension RecommendCycleView {
    private func addCycleTimer() {
        cycleTimer = Timer(timeInterval: 3, target: self, selector: #selector(scrollToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(cycleTimer!, forMode: .commonModes)
    }
    
    private func removeCycleTimer() {
        cycleTimer?.invalidate() // 从运行循环中移除
        cycleTimer = nil
    }
    
    @objc private func scrollToNext() {
        let offsetX = collectionView.contentOffset.x + collectionView.bounds.width
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
}

