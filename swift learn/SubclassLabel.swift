

//
//  SubclassLabel.swift
//  swift learn
//
//  Created by a on 2017/5/3.
//  Copyright © 2017年 ower[]. All rights reserved.
//

import UIKit

open class SubclassLabel: UILabel {

    open class func labeltt() ->SubclassLabel {
        return SubclassLabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //never
    func crashAndBurn() -> Never {
        fatalError("Something very, very bad happened")
    }
    
    
    
    
}
