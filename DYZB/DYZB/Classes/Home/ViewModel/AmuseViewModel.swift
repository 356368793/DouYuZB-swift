//
//  AmuseViewModel.swift
//  DYZB
//
//  Created by xiaochen on 2018/1/25.
//

import UIKit

class AmuseViewModel: BaseViewModel {

}

extension AmuseViewModel {
    func loadAmuseData(finishedCallback : @escaping () -> ()) {
        loadAnchorData(isGroupData: true, URLString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2", finishedCallback: finishedCallback)
    }
}
