//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Base {
    var name : String
    
    init(name newName: String) {
        name = newName
    }
    
    func des
    
}

class Foo : Base {
}

class Bar : Base {
}


let numbers = [ 10000, 10303, 30913, 50000, 100000, 101039, 1000000 ]

let formattedNumbers = numbers.map { $0 + 1}


let mixedArray = [Foo(name: "Frank"), Bar(name: "Bob"), Foo(name: "Gary")]
func filterTest(filter : (item : Base) -> Bool) -> [Base] {
    
    return mixedArray.filter(filter)
}

let items = filterTest { item in return true }


func filterTypes<T>(filter : ((item : T) -> Bool)) -> [T] {
    
    var items = [T]()
    
    let arr = mixedArray.filter {
        if $0 is T {
            items.append($0 as! T)
            return true
        }
        
        return false
    }
    
    return items
}

let bars = filterTypes{ (item : Foo) -> Bool in
    return true
}

let frank = filterTypes { (item : Foo) -> Bool in
    return item.name == "Frank"
}


let bobs = filterTypes() { (item : Bar) -> Bool in
    return true
}

