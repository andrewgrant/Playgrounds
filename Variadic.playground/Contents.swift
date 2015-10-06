//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"





func arrayVarAgs(args :[CVarArgType])
{
    let num = args.count
    
    print(String(format: "Vags1 got %d objects", num))
}

func rawVarArgs(args : CVarArgType...)
{
    let num = args.count

    print(String(format: "Vags2 got %d objects", num))
    
    arrayVarAgs(args)
}


rawVarArgs("Hello", "one")

var globalString = "Boo"


//Logger.Instance.Cloudkit.info("Got to line %d", 7)
