//
//  testprotocol.swift
//  swift learn
//
//  Created by a on 2017/4/28.
//  Copyright © 2017年 ower[]. All rights reserved.
//

import UIKit

public protocol testprotocol:class {  //协议中的class关键字用来限制该协议只能应用在类上
    
    var fff:CGFloat { get set }
    var butt:UIButton? { get set }
//    var backgroundColor:UIColor? { get set }
//    
//    var str:String? { get }
//    
//    var flag:Bool { get set }
//    
//    var image:UIImage? { get set }
    
}

public extension testprotocol where Self:UIViewController {
    public func vt (){
        if fff.isNaN {
            fff = 1
        }
    }
    
    fileprivate func ttt () {
        
    }
}

public extension testprotocol where Self:UIButton {
    
    public func butt() {
        guard let but = butt else {
            return
        }
        but.backgroundColor = .red
    }
}

private extension testprotocol where Self:UIView {
    
}





