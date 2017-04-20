//
//  TestViewController.swift
//  swift learn
//
//  Created by a on 2017/4/11.
//  Copyright © 2017年 ower[]. All rights reserved.
//

import UIKit

internal func Init<T> (_ type:T,block:(_ t:T) ->Void) ->T{
    block(type)
    return type
}





struct IntStack {
    var items = [Int]()
    mutating func push(item:Int){
        items.append(item)
    }
    mutating func pop() ->Int{
        return items.removeLast()
    }
    
}

///泛型    T, U, V
struct Stack<T> {
    var items = [T]()
    mutating func push(item:T){
        items.append(item)
    }
    mutating func pop() ->T {
        return items.removeLast()
    }
}





class TestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        //usage
        var stackStr = Stack<Any>()
        stackStr.push(item: "i")
        stackStr.push(item: "l")
        stackStr.push(item: "p")
        // let popItem = stackStr.pop()
        //函数类型作为返回类型 if guard let .. else {}
        func add(_ one:Int) ->Int{
            return one + 1
        }
        func reduce(_ two:Int) ->Int{
            return two - 1
        }
        
        func test(flag:Bool) ->(Int) ->Int {
            return flag ? add : reduce
            
        }
        
        //闭包
        let arr = [20, 28, 11, 2, 9]
        let newArr = arr.sorted(by: >)
        let arr1 = arr.sorted(by: <)
        print("newArr =\(newArr)\n------\(arr1)")
        
        
        let vi = Init(UIView()) {
            $0.backgroundColor = UIColor.red
            $0.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        }
        
        
        let ges = UITapGestureRecognizer(target: self, action: #selector(gesTure))
        vi.isUserInteractionEnabled = true
        vi.addGestureRecognizer(ges)
        view.addSubview(vi)
        
        
        
    }
    
    func gesTure(){
        
    }
    
}

//／泛型扩展    topItem 计算型属性
extension Stack {
    var topItem:T? {
        return items.isEmpty ? nil : items[items.count-1]
    }
    
}

protocol TT {
    
}

///log
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











