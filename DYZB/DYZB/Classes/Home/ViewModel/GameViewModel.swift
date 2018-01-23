//
//  GameViewModel.swift
//  DYZB
//
//  Created by xiaochen on 2018/1/23.
//

import UIKit

class GameViewModel: NSObject {
    lazy var games : [GameModel] = [GameModel]()
}


extension GameViewModel {
    func loadAllGameData(finishedCallback: @escaping () -> ()) {
        NetworkTools.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getColumnDetail", parameters: ["shortName" : "game"]) { (result) in
            // 1. 获取到数据
            guard let resultDic = result as? [String: Any] else { return }
            
            // 2. 获取data
            guard let dataArray = resultDic["data"] as? [[String : Any]] else { return }
            
            // 3. 字典转模型
            for dict in dataArray {
                self.games.append(GameModel(dict: dict))
            }
            
            // 4.完成回调
            finishedCallback()
        }
    }
}
