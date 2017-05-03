
//
//  CAEmitterLayerViewController.swift
//  swift learn
//
//  Created by a on 2017/5/3.
//  Copyright © 2017年 ower[]. All rights reserved.
//

import UIKit
//一个单独的CAEmitterLayer可以支持多个CAEmitterCell  粒子系统
class CAEmitterLayerViewController: UIViewController {
    
    var snow:CAEmitterLayer?
    var flake:CAEmitterCell?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        configCAEmitter()
        printLog("ttt\(String(describing: snow))")
        
    }

    fileprivate func configCAEmitter() {
        
        snow = Init(CAEmitterLayer()) {
            $0.emitterPosition = CGPoint(x: 120, y: 20)
            $0.emitterSize = CGSize(width: self.view.bounds.size.width*20, height: 300)
            $0.emitterMode = kCAEmitterLayerSurface
            $0.emitterShape = kCAEmitterLayerLine
            $0.shadowOpacity = 1.0
            $0.shadowRadius = 0.0
            $0.shadowOffset = CGSize(width: 0.0, height: 1.0)
            $0.shadowColor = UIColor.blue.cgColor
        }
        
        flake = Init(CAEmitterCell()) {
            $0.name = "snow"
            $0.birthRate = 1.0
            $0.lifetime = 12.0
            $0.velocity = 1.0
            $0.velocityRange = 10.0
            $0.yAcceleration = 2.0
            $0.emissionRange = 0.5 * .pi
            $0.spinRange = 0.25 * .pi
            $0.contents = UIImage(named: "yuedu")?.cgImage
            $0.color = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1) .cgColor
            
        }
        
        snow?.emitterCells = [flake!]
        view.layer.insertSublayer(snow!, at: 0)
    }
    
    fileprivate func ttt(_ line:UInt = #line, _ file:StaticString = #file) {
        print("tt\(line)\(file)")
    }
    
    
}










