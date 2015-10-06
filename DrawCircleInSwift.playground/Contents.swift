
//: Figuring out how to draw a circle into a UIImage with Swift

import UIKit

func drawCircle(context : CGContext, bounds : CGRect, color : CGColorRef, filled : Bool = true, lineWidth: CGFloat = 1.0)
{
    CGContextSaveGState(context)
 
    // It's possible to draw via path arcs, but for a simple circle using
    // an elipse in a rect is a lot less code...
    if filled {
        CGContextSetFillColorWithColor(context, color)
        CGContextFillEllipseInRect(context, bounds)
    }
    else {
        let inner = bounds.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
        CGContextSetLineWidth(context, lineWidth)
        CGContextSetStrokeColorWithColor(context, color)
        CGContextStrokeEllipseInRect(context, inner)
    }
    
    CGContextRestoreGState(context)
}

let bounds = CGRect(x: 0, y: 0, width: 32, height: 32)

UIGraphicsBeginImageContext(bounds.size)

let ctx = UIGraphicsGetCurrentContext()!

UIColor.clearColor().set()

CGContextFillRect(ctx, bounds)

drawCircle(ctx, bounds: bounds, color: UIColor.greenColor().CGColor, filled: false, lineWidth: 4.0)

let inset = bounds.insetBy(dx: (bounds.size.width / 4), dy: (bounds.size.height / 4))
drawCircle(ctx, bounds: inset, color: UIColor.greenColor().CGColor, filled: true)


let img = UIGraphicsGetImageFromCurrentImageContext()

UIGraphicsEndImageContext()

// Wrapping the above into a function

func stateImageForColor(bounds : CGRect, color : UIColor, checked : Bool) -> UIImage {
    
    UIGraphicsBeginImageContext(bounds.size)
    
    let ctx = UIGraphicsGetCurrentContext()!
    
    UIColor.clearColor().set()
    
    CGContextFillRect(ctx, bounds)
    
    drawCircle(ctx, bounds: bounds, color: color.CGColor, filled: false, lineWidth: 4.0)
    
    let inset = bounds.insetBy(dx: (bounds.size.width / 4), dy: (bounds.size.height / 4))
    drawCircle(ctx, bounds: inset, color: color.CGColor, filled: true)
    
    
    let img = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()

    return img
}

let img2 = stateImageForColor(bounds, color: UIColor.redColor(), checked: false)
