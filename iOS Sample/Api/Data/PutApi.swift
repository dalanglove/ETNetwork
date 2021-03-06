//
//  PutApi.swift
//  iOS Sample
//
//  Created by gengduo on 15/12/16.
//  Copyright © 2015年 ethan. All rights reserved.
//

import UIKit
import ETNetwork

class PutApi: ETRequest {
    var bar: String
    init(bar: String) {
        self.bar = bar
        super.init()
    }
}

extension PutApi: ETRequestProtocol {
    var method: ETRequestMethod { return .Put }
    var taskType: ETTaskType { return .Data }
    var requestUrl: String { return "/put" }
    var parameters:  [String: AnyObject]? {
        return ["foo": bar]
    }
}


extension PutApi: ETRequestCacheProtocol {
    var cacheVersion: UInt64 { return 1 }
    var cacheSeconds: Int { return 60 }
}
