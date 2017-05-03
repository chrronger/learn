//
//  TestViewController.swift
//  swift learn
//
//  Created by a on 2017/4/11.
//  Copyright © 2017年 ower[]. All rights reserved.
//

import UIKit

//
internal func Init<T> (_ type:T,block:(_ t:T) ->Void) ->T{
    block(type)
    return type
}



//open class func completionBlock() -> (() -> Swift.Void)?
//
//open class func setCompletionBlock(_ block: (() -> Swift.Void)?)

//T 遵守Hashable协议
func iterateEnum<T: Hashable>(from: T.Type) -> AnyIterator<T> {
    var x = 0
    return AnyIterator {
        let next = withUnsafePointer(to: &x) {
            $0.withMemoryRebound(to: T.self, capacity: 1) { $0.pointee }
        }
        defer {
            x += 1
        }
        return next.hashValue == x ? next : nil
    }
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





class TestViewController: UIViewController,testprotocol {
    
    var fff: CGFloat = .nan
    var butt: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vt()
        
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
        
        let info = Info()
        
        var ar = [Info]()
        info.age = 10
        
        ar.append(info)
        
        
        //闭包
        let arr = [20, 28, 11, 2, 9]
        let newArr = arr.sorted(by: >)
        let arr1 = arr.sorted(by: <)
        print("newArr =\(newArr)\n------\(arr1)")
        
        
        let vi = Init(UIView()) {
            $0.backgroundColor = #colorLiteral(red: 0.7603954635, green: 0.3086948579, blue: 0.8078431487, alpha: 1)
            $0.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
            $0.layer.borderColor = #colorLiteral(red: 0.7603954635, green: 0.3086948579, blue: 0.8078431487, alpha: 1).cgColor
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
//func printIn(_ item: @autoclosure () -> Any) {
//    #if DEBUG
//        Swift.print(item())
//    #endif
//}
//log
func printLog<T>(_ message: T,
              file: String = #file,
              method: String = #function,
              line: Int = #line)
{
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
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









