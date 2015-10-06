// Groking Swift closure syntax

import UIKit

var str = "Hello, playground"

// Single param, no return
func sayHello(name: String,
    handler: (String) -> Void)
{
    handler(String(format: "Hello %@", name))
}

// inline format
sayHello("Bob", handler: { (newString) -> Void in
    let str1 = newString
})

// trailing format
sayHello("Bob") { (newString) -> Void in
    let str = newString
}

// trailing with types omitted
sayHello("Frank") { newString in
    let str = newString
}

// Two params
func sayHelloDate(name: String, handler : (String, NSDate) -> Void) {
    handler(String(format: "Hello %@", name), NSDate())
}

// Trailing format
sayHelloDate("Fred") { (newString, newDate) -> Void in
    let str = newString
    let date = newDate
}


// Two params, one return
func sayHelloMaybeTwice(name: String, handler : (String, NSDate) -> Bool) {
    let str = String(format: "Hello %@", name)
    
    if handler(name, NSDate.distantPast() as! NSDate) {
        handler(name, NSDate.distantFuture() as! NSDate)
    }
}

sayHelloMaybeTwice("John", handler: { (newString, newDate) -> Bool in
    let str = newString
    let date = newDate
    return false
})


sayHelloMaybeTwice("John", handler: { (newString, newDate) -> Bool in
    let str = newString
    let date = newDate
    return true
})

// Two closures
func sayHelloAndGoodbye(name : String, first : (String) -> Void, second : (String) -> Void) {
    first("Hello " + name)
    second("Goodbye " + name)
}

// inline
sayHelloAndGoodbye("Jim", first: { (newString) -> Void in
    let str = newString
}) { (newString) -> Void in
    let str = newString
}

// trailing (seems only last closure can trail? Makes sense)
sayHelloAndGoodbye("Frank", first: { (newString) -> Void in
    let str = newString
})
{ (newString) -> Void in
    let str = newString
}

