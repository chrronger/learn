//
//  TestViewController.swift
//  swift learn
//
//  Created by a on 2017/4/11.
//  Copyright © 2017年 ower[]. All rights reserved.
//

import UIKit


class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

   
    

    

}


func println(_ item: @autoclosure () -> Any) {
    #if DEBUG
        Swift.print(item())
    #endif
}


public final class GRRong<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}



extension GRRong where Base:UIView {
    
}
