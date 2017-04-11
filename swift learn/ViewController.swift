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


enum SeverResponse{
    case Result(String,String)
    case Failure(String)
}


//使用 enum 来创建一个枚举。就像类和其他所有命名类型一样，枚举可以包含方法 , 使用 rawValue 属性来访问一个枚举成员的原始值
//hashValue 实际值 。从0加1赋值
enum Rank:Int {
    case Ace = 1
    case Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten
    case Jack,Queen,King
    func simpleDescription() ->String{
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
//使用 struct 来创建一个结构体。结构体和类有很多相同的地方，比如方法和构造器。它们之间最大的一个区别就 是结构体是传值，类是传引用
struct Card {
    var rank:Rank
    
}

//协议和扩展,类(class)、枚举和结构体都可以实现协议
//使用 mutating 关键字修饰方法是为了能在该方法中修改 struct 或是 enum 的变量，在设计接口的时候，也要考虑到使用者程序的扩展性。所以要多考虑使用mutating来修饰方法
//在 class 中实现带有mutating方法的接口时，不用mutating进行修饰。因为对于class来说，类的成员变量和方法都是透明的，所以不必使用 mutating 来进行修饰, struct 或是 enum需要使用mutating func adjust(){}
protocol ExampleProtocol {
    var simpleDecrition:String {get}
    mutating func adjust()
}
//
extension Int:ExampleProtocol{
    mutating internal func adjust() {
        
    }

    internal var simpleDecrition: String {
        return "aa"
    }

    
}
//错误处理  使用 throw 来抛出一个错误并使用 throws 来表示一个可以抛出错误的函数。如果在函数中抛出一个错误，这个函 数会立刻返回并且调用该函数的代码会进行错误处理。

enum PrinterError:Error {
    case OutOfPaper
    case NoToner
    case OnFire
}






class ViewController: UIViewController {

    //使用 throw 来抛出一个错误并使用 throws 来表示一个可以抛出错误的函数。如果在函数中抛出一个错误，这个函 数会立刻返回并且调用该函数的代码会进行错误处理。
    func send(job:Int,toPrinter printerName:String) throws ->String{
        switch printerName {
        case "never has toner":
            throw PrinterError.NoToner
        case "onfire":
            throw PrinterError.OnFire
        default:
            return "Job sent"
        }
//        if printerName == "never has toner" {
//            throw PrinterError.NoToner
//        }
//        if printerName == "onfire" {
//            throw PrinterError.OnFire
//        }
//        return "Job sent"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("ttt")
        
       //有多种方式可以用来进行错误处理。一种方式是使用 do-catch 。在 do 代码块中，使用 try 来标记可以抛出错误 的代码。在 catch 代码块中，除非你另外命名，否则错误会自动命名为 error
        do {
            let printerResponse = try send(job: 1040, toPrinter: "bi sheng")//never has toner 抛出错误
            print(printerResponse)
        } catch {
            print(error)
        }
        //也可以使用多个 catch 块来处理特定的错误
        do {
            let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
            //let p = try send(job: 1440, toPrinter: "never has toner")
            let p1 = try send(job: 1440, toPrinter: "onfire")
            print(printerResponse)
        } catch PrinterError.OnFire {
            print("I'll just put this over here, with the rest of the fire.")
        } catch let printerError as PrinterError {
            print("Printer error: \(printerError).")
        } catch {
            print(error)
        }
        //另一种处理错误的方式使用 try? 将结果转换为可选的。如果函数抛出错误，该错误会被抛弃并且结果为 ni l 。否则的话，结果会是一个包含函数返回值的可选值。
        let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
        let printerFailure = try? send(job: 1885, toPrinter: "never has toner")
        
        
        //使用 defer 代码块来表示在函数返回前，函数中最后执行的代码。无论函数是否会抛出错误，这段代码都将执 行。使用 defer ，可以把函数调用之初就要执行的代码和函数调用结束时的扫尾代码写在一起，虽然这两者的执 行时机截然不同
        var fridgeIsOpen = false
        let fridgeContent = ["milk", "eggs", "leftovers"]
        func fridgeContains(_ food: String) -> Bool {
            fridgeIsOpen = true
            defer {
                fridgeIsOpen = false
            }
            let result = fridgeContent.contains(food)
            return result
        }
        print(fridgeContains("banana"),fridgeIsOpen)
        
        //范型   可以创建泛型函数、方法、类、枚举和结构体
        func reptatItem<T> (repeating item:T,numOfTimes:Int)->[T]{
            var result = [T]()
            for _ in 0..<numOfTimes{
                result.append(item)
            }
            
            return result
        }
        print(reptatItem(repeating: "knock", numOfTimes: 4))
        
        
        
        
        let label = "the width is"
        let width = 22
        let widthLabel = label + "\(width)"
        let widthl = label + String(width)
        print(widthLabel,widthl)
        
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
        
        print(greet(person: "Bob", day: "Monday"))
        
        
        print(calculateStatistics(scores: [4,9,50,20]).sum)
        //
        print(calculateStatistics(scores: [4,9,50,20]).1)
        
        print(sumOf())
        print(sumOf(numbers: 20,30,40))
        
        print(returnFifteen())
        
        
        //当一个闭包作为最后一个参数传给一个函数的时候，它可以直接跟在括号后面。当一个闭包是传给函数的唯一参数，你可以完全忽略括号。
        let nums = [10,2,4]
        let sortedNums = nums.sorted{$1 > $0}
        print(sortedNums)
        
        //get set  willSet didSet
        var t:Int = 0
        var ttt:Int {
            get {
                return 3+t
            }
            set{
                t = newValue+3
            }
        }
        print(ttt)
        
        //处理变量的可选值时，你可以在操作(比如方法、属性和子脚本)之前加 ? 。如果 ? 之前的值是 nil ， ? 后面 的东西都会被忽略，并且整个表达式返回 nil 。否则， ? 之后的东西都会被运行。在这两种情况下，整个表达式 的值也是一个可选值。
        
        //enum
        let ace = Rank.King
        let aceRawValue = ace.rawValue //
        print(aceRawValue)
        
        if let convertedRank = Rank(rawValue:3){
            let threeDescription = convertedRank.simpleDescription()
            print(threeDescription)
        }
        
        //let success = SeverResponse.Result("8:00 am", "18:00 pm")
        //let failure = SeverResponse.Failure("out of cheese")
        
        
    
    
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
        
        //while
        var n = 2
        while n < 100 {
            n = n*2
        }
        print(n)
        
        //repeat  while
        var m = 2
        repeat {
            m = m*2
        } while m < 100
        print(m)
        
        //..<
        var total = 0
        for i in 0..<4 {
            total += i
        }
        print(total)
    }
    
    //函数和闭包
    //使用 func 来声明一个函数，使用名字和参数来调用函数。使用 -> 来指定函数返回值的类型
    private func greet(person:String,day:String)->String {
        return "hello \(person),today is \(day)."
    }
    
    //使用元组来让一个函数返回多个值。该元组的元素可以用名称或数字来表示。
    func calculateStatistics(scores:[Int])->(min:Int,max:Int,sum:Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0
        
        for score in scores {
            if score > max {
                max = score
            }else if score < min {
                min = score
            }
            sum += score
        }
        return (min,max,sum)
    }

    //函数可以带有可变个数的参数，这些参数在函数内表现为数组的形式
    func sumOf(numbers:Int...)->Int{
        var sum = 0
        numbers.forEach { (num) in
            sum += num
        }
        return sum
    }
    
    //函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数
    func returnFifteen()->Int{
        var y = 10
        func add() {
            y += 5
        }
        add()
        return y
    }
    
    //函数可以作为另一个函数的返回值。
    func makeIncrementer()->((Int) ->Int){
        func addOne(num:Int) ->Int{
            return 1+num
        }
        return addOne
    }
    
    //函数也可以当做参数传入另一个函数
    func hasAnyMatches(list:[Int],condition:(Int)->Bool) -> Bool {
        
        for item in list {
            if condition(item){
                return true
            }
        }
        return false
    }
    func lessThanTen(num:Int) ->Bool {
        return num < 10
    }
    
    
    
    
}

