//
//  NSDate+Formatter.swift
//  SouthWeekend
//
//  Created by 随随意 on 17/2/8.
//  Copyright © 2017年 suisuiyi. All rights reserved.
//

import Foundation

extension Date {
    
    func detlaString() -> String {
        
        let time = Int(-self.timeIntervalSinceNow)
        print(time)
        if time <= 3600 {
            return "刚刚"
        }
        else if time <= 3600 * 24 {
            return "\(Int(time/3600))小时前"
        }
        else if time <= 3600 * 24 * 30 {
            return "\(Int(time/3600/24))天前"
        }
        else if time <= 3600 * 24 * 30 * 12 {
            return "\(Int(time/3600/24/12))年前"
        }
        return ""
    }

}

extension String {
    func stringToDate() -> Date? {
        let str = self.description
        let dateFormattor = DateFormatter()
        dateFormattor.dateFormat = "yyyy/MM/dd hh:mm:ss"
        return dateFormattor.date(from: str)
    }
}
