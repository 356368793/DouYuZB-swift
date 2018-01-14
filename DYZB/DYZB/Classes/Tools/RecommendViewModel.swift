//
//  RecommendViewModel.swift
//  DYZB
//
//  Created by 小C on 2018/1/13.
//

import UIKit

class RecommendViewModel {
    // MARK:- lazy initializaiton
    private lazy var anchorGroups: [AnchorGroup] = [AnchorGroup]()
}

// MARK:- 发送网络请求
extension RecommendViewModel {
    func requestData() {
        // 0.定义参数
        let parameters = ["limit" : "4", "offset" : "0", "time" : Date.getCurrentTime()]
        
        // 1. 请求第一部分推荐数据
        
        // 2. 请求第二部分颜值数据
        NetworkTools.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: parameters) { (result) in
            print(result)
        }
        
        // 3. 请求后面部分游戏数据
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
            
//            for group in self.anchorGroups {
//                for anchor in group.anchors {
//                    print(anchor.nickname)
//                }
//                print("--------")
//            }
        }
    }
}
