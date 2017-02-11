////
////  RouterNews.swift
////  SouthWeekend
////
////  Created by 随随意 on 17/2/9.
////  Copyright © 2017年 suisuiyi. All rights reserved.
////
//
//import Foundation
//import Alamofire
//extension Router.News: URLRequestConvertible,HTTPRequestDataConvertible {
//    
//    func httpRequestData() -> HTTPRequestData {
//        var method: HTTPMethod = .get
//        var url: String = "http://www.infzm.com/mobile/get_list_by_cat_ids"
//        var parameters: [String: AnyObject]? = .none
//        
//        switch self {
//        case .homeNews(let cat_id, let start, let count, let platform,  let device, let version, let system_version, let hash, let format):
//            parameters = ["cat_id": cat_id,
//                          "start": start,
//                          "count": count,
//                          "platform": platform,
//                          "device": device,
//                          "version": version,
//                           "system_version": system_version,
//                           "hash": hash,
//                           "format": format
//            ]
//        }
//        return (method, url, parameters)
//
//    }
//    
//    var URLRequest: NSMutableURLRequest {
//        return Router.requestFromHTTPRequestData(httpRequestData())
//    }
//
//    
//}
