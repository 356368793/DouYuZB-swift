//
//  NetworkTools.swift
//  DYZB
//
//  Created by 小C on 2018/1/13.
//

import UIKit
import Alamofire

enum MethodType {
    case GET
    case POST
}

class NetworkTools: NSObject {
    class func requestData(type: MethodType, URLString: String, parameters: [String: Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        
        let method = (type == .GET ? HTTPMethod.get : HTTPMethod.post)
        
        Alamofire.request(URLString, method: method, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error!)
                return
            }
            finishedCallback(result)
        }
    }
}
