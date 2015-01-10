// Playground - noun: a place where people can play

import Cocoa

class MyView : NSView {
    /*
    override func drawRect(rect: NSRect) {
        var pathRect = NSInsetRect(self.bounds, 1, 2)
        
        var path = NSBezierPath(roundedRect: pathRect, xRadius: 10, yRadius: 10)
        
        path.lineWidth = 4
        
        NSColor.greenColor().setFill()
        NSColor.blackColor().setStroke()
        path.fill()
        path.stroke()
    } */
    
    /*
    override func drawRect(rect: NSRect) {
        var bezierPath = NSBezierPath()
        
        // Create a rectangle that's inset by 5% on all sides
        var drawingRect = CGRectInset(self.bounds, self.bounds.size.width * 0.05, self.bounds.size.height * 0.05)
        
        // Define the points that make up the drawing
        var topLeft = CGPointMake(CGRectGetMinX(drawingRect), CGRectGetMaxY(drawingRect))
        
        var topRight = CGPointMake(CGRectGetMaxX(drawingRect), CGRectGetMaxY(drawingRect))
        
        var bottomRight = CGPointMake(CGRectGetMaxX(drawingRect), CGRectGetMinY(drawingRect))
        
        var bottomLeft = CGPointMake(CGRectGetMinX(drawingRect), CGRectGetMinY(drawingRect))
        
        var center = CGPointMake(CGRectGetMidX(drawingRect), CGRectGetMidY(drawingRect))
        
        // Start drawing
        bezierPath.moveToPoint(topLeft)
        bezierPath.lineToPoint(topRight)
        bezierPath.lineToPoint(bottomLeft)
        bezierPath.curveToPoint(bottomRight, controlPoint1: center, controlPoint2: center)
        
        // Finish drawing by closing the path
        bezierPath.closePath()
        
        // Set the colors and draw them
        NSColor.redColor().setFill()
        NSColor.blackColor().setStroke()
        
        bezierPath.fill()
        bezierPath.stroke()
    }*/
    
    override func drawRect(rect: NSRect) {
        // Create an empty Bezier path
        let bezierPath = NSBezierPath()
        
        // Define the rectangle for the two components
        let squareRect = CGRectInset(rect, rect.size.width * 0.45, rect.size.height * 0.05)
        
        let circleRect = CGRectInset(rect, rect.size.width * 0.3, rect.size.height * 0.3)
        
        let cornerRadius: CGFloat = 20
        
        // Create the paths
        var circlePath = NSBezierPath(ovalInRect: circleRect)
        var squarePath = NSBezierPath(roundedRect: squareRect, xRadius: cornerRadius, yRadius: cornerRadius)
        
        // Add them to the main path
        squarePath.appendBezierPath(circlePath)
        bezierPath.appendBezierPath(squarePath)
        
        
        NSGraphicsContext.saveGraphicsState()
        
        let shadow = NSShadow()
        shadow.shadowColor = NSColor.blackColor()
        shadow.shadowOffset = NSSize(width: 3, height: 2)
        shadow.shadowBlurRadius = 10
        shadow.set()
        
        // Set the color and draw them
        NSColor.redColor().setFill()
        
        // Draw the path
        bezierPath.fill()
        
        NSGraphicsContext.restoreGraphicsState()
    }
}

let viewRect = NSRect(x: 0, y: 0, width: 100, height: 100)
let myEmptyView = MyView(frame: viewRect)



