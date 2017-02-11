//
//  Router.swift
//  SouthWeekend
//
//  Created by 随随意 on 17/2/5.
//  Copyright © 2017年 suisuiyi. All rights reserved.
//

import Foundation
import Alamofire

typealias HTTPRequestData = (HTTPMethod, String, Dictionary<String, AnyObject>?)
typealias JSONReformer = (Dictionary<String, AnyObject>) -> Dictionary<String, AnyObject>


protocol HTTPRequestDataConvertible {
    func httpRequestData() -> HTTPRequestData
}

struct Router {
    typealias cat_id = String
    typealias start = String
    typealias count = String
    typealias platform = String
    typealias device = String
    typealias version = String
    typealias system_version = String
    typealias hash = String
    typealias format = String
    
    let baseURL = "http://www.infzm.com/mobile/get_list_by_cat_ids"
    let newHomePageUrl = "http://www.infzm.com/mobile/get_list_by_cat_ids?cat_id%5B%5D=5282&start=0&count=10&platform=ireader&device=Unknown%20iPad&version=5.2.3&system_version=10.2&hash=a2d1e67d2daa18d8781a7126c6982649&format=json"
//    let homeParematers = []
//    parameters = [            "cat_id": cat_id,
//                              "start": start,
//                              "count": count,
//                              "platform": platform,
//                              "device": device,
//                              "version": version,
//                               "system_version": system_version,
//                               "hash": hash,
//                               "format": format
//                ]

    enum News {
        case homeNews(cat_id,start,count,platform,device,version,system_version,hash,format)
        case searchNews()
    }
}


