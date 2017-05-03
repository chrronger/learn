//
//  User.swift
//  swift learn
//
//  Created by a on 2017/5/2.
//  Copyright © 2017年 ower[]. All rights reserved.
//

import UIKit

class User: NSObject {
    
    
    override init() {
        var arr = [Info]()
       
        arr.append(Info())
    }
}

//switch self
//public func >(lhs: Int, rhs: Int) -> Bool     运算符  func
//
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}
