//
//  ResourceProvider.swift
//  SouthWeekend
//
//  Created by 随随意 on 17/2/6.
//  Copyright © 2017年 suisuiyi. All rights reserved.
//

import Foundation
import UIKit
///  这个东西写成常量的话，那么横竖屏的话，这个值也不会变化。
let SCREENBOUNDS = UIScreen.main.bounds
let SCREENWIDTH = SCREENBOUNDS.width
let SCREENHEIGHT = SCREENBOUNDS.height
let ScreenScale = UIScreen.main.scale
let NavigationBarHeight: CGFloat = 64
let TabBarHeight: CGFloat = 49

let Animate_Duration = 0.25
class ResourceProvider {
    /// 16
    let titleFont = UIFont.boldSystemFont(ofSize: 16)
    /// 14
    let plainTextFont = UIFont.systemFont(ofSize: 14)
    /// 12
    let subtitleFont = UIFont.systemFont(ofSize: 12)
    
    let titleColor = UIColor(white: 29 / 255.0, alpha: 1)
    let subtitleColor = UIColor(white: 174 / 255.0, alpha: 1)
    
    let promptTextFont = UIFont.systemFont(ofSize: 10)
    let BlankView = UIView(frame: CGRect.zero)
    
    //MARK: - Controller view backgroundColor
    class func backgroundColor() -> UIColor {
        struct Static {
            static let backgroundColor: UIColor = UIColor(white: 238/255.0, alpha: 1)
        }
        return Static.backgroundColor
    }


}
