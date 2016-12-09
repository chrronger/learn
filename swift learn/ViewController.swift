//
//  ViewController.swift
//  swift learn
//
//  Created by 希 Guan on 2016/12/9.
//  Copyright © 2016年 ower[]. All rights reserved.
//

import UIKit

//做一件事，为什么要这样做
//写句代码为什么这么写，这么写的作用？
//学无止境    `勤思考`
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = "the width is"
        let width = 22
        let widthLabel = label + "\(width)"
        //let widthLabel = label +String(width)
        print(widthLabel)
        
        //数组
        var shoppingList = ["hotdog","water","food"]
        shoppingList[1] = "bottle of water"
        
        print(shoppingList)
        
        
        
//        let emptyArray = [String]()
        
        
        
        //字典
        var occuptions = ["Jock":"seaman",
                          "Joe":"teacher"]
        occuptions["Enlen"] = "Public relations"
        
        //let emptyDictionary = [String:Float]()
       
        
        print(occuptions)
        
        //控制流
        controlStraem()
        
    }

    private func controlStraem() {
        //for
        let arr = [75,43,103,87,12]
        var score = 0
//        for s in arr {
//            if s > 50 {
//                score += 3
//            } else{
//                score += 1
//            }
//        }
        
        arr.forEach { s in
            if s > 50 {
                score += 3
            } else{
                score += 1
            }
        }
        print(score)
        
        //?可选值处理
        let opionalString:String? = "Hello"
        print(opionalString == nil)
        
        let optionalName:String? = "John"
        var greeting = "Hello"
        if let name = optionalName{
            greeting = "\(greeting),\(name)"
        }
        print(greeting)
        
        //另一种处理可选值的方法是通过使用 ?? 操作符来提供一个默认值。如果可选值缺失的话，可以使用默认值来代替。
        let nickName:String? = nil
        let fullName:String = "John"
        let informalGreeting = "Hi,\(nickName ?? fullName)"
        print(informalGreeting)
        
        //switch 支持任意类型的数据以及各种比较操作——不仅仅是整数以及测试相等
        let vegetable = "a red"
        switch vegetable {
        case "celery":
            print("1")
        case "cucumber","watercress":
            print("2")
        //let where :vegetable是否以red结尾。
        case let x where x.hasSuffix("red")://
            print(x)
        default:
            print("default")
        }
        
        let interestingNumbers = [
            "Prime": [2, 3, 5, 7, 11, 13],
            "Fibonacci": [1, 1, 2, 3, 5, 8],
            "Square": [1, 4, 9, 16, 25],
            ]
        var largest = 0
        for (_,numbers) in interestingNumbers {
            for number in numbers {
                if number > largest {
                    largest = number
                }
            }
        }
        print(largest)
    }


}

