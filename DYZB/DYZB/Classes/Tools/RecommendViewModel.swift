//
//  RecommendViewModel.swift
//  DYZB
//
//  Created by 小C on 2018/1/13.
//

import UIKit

class RecommendViewModel: BaseViewModel {
    // MARK:- lazy initializaiton
    private lazy var bigDataGroup : AnchorGroup = AnchorGroup()
    private lazy var prettyGroup : AnchorGroup = AnchorGroup()
    lazy var cycleModels: [CycleModel] = [CycleModel]()
}

// MARK:- 发送网络请求
extension RecommendViewModel {
    func requestData(finishCallBack: @escaping () -> ()) {
        // 0.定义参数
        let parameters = ["limit" : "4", "offset" : "0", "time" : Date.getCurrentTime()]
        
        let dGroup = DispatchGroup()
        
        // 1. 请求第一部分推荐数据
        dGroup.enter()
        NetworkTools.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: ["time": Date.getCurrentTime()]) { (result) in
            // 1. result -> dic
            guard let dic = result as? [String: NSObject] else { return }
            
            // 2. dic -> dataArray
            guard let dataArray = dic["data"] as? [[String: NSObject]] else { return }
            
            // 3.遍历字典,并且转成模型对象
            // 3.1.设置组的属性
            self.bigDataGroup.tag_name = "热门"
            self.bigDataGroup.icon_name = "home_header_hot"
            
            for dataDic in dataArray {
                let anchor = AnchorModel(dict: dataDic)
                self.bigDataGroup.anchors.append(anchor)
            }
            
            // 3.2. 离开组
            dGroup.leave()
        }
        
        // 2. 请求第二部分颜值数据
        dGroup.enter()
        NetworkTools.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: parameters) { (result) in
            // 1. result -> dic
            guard let dic = result as? [String: NSObject] else { return }
            
            // 2. dic -> dataArray
            guard let dataArray = dic["data"] as? [[String: NSObject]] else { return }
            
            // 3.遍历字典,并且转成模型对象
            // 3.1.设置组的属性
            self.prettyGroup.tag_name = "颜值"
            self.prettyGroup.icon_name = "home_header_phone"
            
            for dataDic in dataArray {
                 let anchor = AnchorModel(dict: dataDic)
                self.prettyGroup.anchors.append(anchor)
            }
            
            
            // 3.2. 离开组
            dGroup.leave()
        }
        
        // 3. 请求后面部分游戏数据
        dGroup.enter()
        NetworkTools.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: parameters) { (response) in
            // 1. response -> dic
            guard let dic = response as? [String: NSObject] else { return }
            
            // 2. data array
            guard let dataArray = dic["data"] as? [[String: NSObject]] else { return }
            
            // 3. get AnchorGroup model data
            for dataDic in dataArray {
                let anchorGroup = AnchorGroup(dict: dataDic)
                self.anchorGroups.append(anchorGroup)
            }
            
            // 4. 离开组
            dGroup.leave()
        }
        
        dGroup.notify(queue: DispatchQueue.main) {
            self.anchorGroups.insert(self.prettyGroup, at: 0)
            self.anchorGroups.insert(self.bigDataGroup, at: 0)
            
            finishCallBack()
        }
    }
    
    // 请求无线轮播的数据
    func requestCycleData(_ finishCallBack: @escaping () -> ()) {
        NetworkTools.requestData(type: .GET, URLString: "http://www.douyutv.com/api/v1/slide/6", parameters: ["version" : "2.300"]) { (result) in
            // 1.获取整体字典数据
            guard let resultDic = result as? [String: NSObject] else { return }
            
            // 2.根据data的key获取数据
            guard let dataArray = resultDic["data"] as? [[String: NSObject]] else { return }
            
            // 3.字典转模型对象
            for dict in dataArray {
                self.cycleModels.append(CycleModel(dict: dict))
            }
            
            finishCallBack()
        }
    }
}
