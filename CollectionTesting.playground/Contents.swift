//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var arr1 = ["Hello", "Playground"]


var arr2 = arr1

arr2.append("Old Friend")


print(arr1)


var dictArr = [String:[Int]]()

dictArr["A"] = [1,2,3]

dictArr["A"]!.append(1)

if var ar = dictArr["A"] {
    ar.append(2)
}

var dict2 = dictArr

var list = dictArr["A"]

list?.removeAtIndex(0)

list

dictArr

dictArr["A"]!.removeAtIndex(0)

dictArr




