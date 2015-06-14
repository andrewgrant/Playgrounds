
//: Figuring out how to draw a circle into a UIImage with Swift

import UIKit

func drawCircle(context : CGContext, bounds : CGRect, color : CGColorRef, filled : Bool = true, lineWidth: CGFloat = 1.0)
{
    CGContextSaveGState(context)
 
    if filled {
        CGContextSetFillColorWithColor(context, color)
        CGContextFillEllipseInRect(context, bounds)
    }
    else {
        var inner = bounds.rectByInsetting(dx: lineWidth / 2, dy: lineWidth / 2)
        CGContextSetLineWidth(context, lineWidth)
        CGContextSetStrokeColorWithColor(context, color)
        CGContextStrokeEllipseInRect(context, inner)
    }
    
    CGContextRestoreGState(context)
}

let bounds = CGRect(x: 0, y: 0, width: 64, height: 64)

UIGraphicsBeginImageContext(bounds.size)

let ctx = UIGraphicsGetCurrentContext()

UIColor.redColor().set()

CGContextFillRect(ctx, bounds)

drawCircle(ctx, bounds, UIColor.greenColor().CGColor, filled: true)
drawCircle(ctx, bounds, UIColor.whiteColor().CGColor, filled: false, lineWidth: 8.0)

let img = UIGraphicsGetImageFromCurrentImageContext()

UIGraphicsEndImageContext()

