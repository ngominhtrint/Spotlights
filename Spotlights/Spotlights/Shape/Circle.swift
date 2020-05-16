//
//  Circle.swift
//  Spotlights
//
//  Created by TriNgo on 5/14/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import UIKit

public class Circle: Shape {
  
  public var radius: CGFloat
  
  public init(radius: CGFloat = 100.0) {
    self.radius = radius
  }
  
  // Override from Shape protocol
  public func draw(center: CGPoint) -> CAShapeLayer {
    // Create the initial layer from the view bounds.
    let maskLayer = CAShapeLayer()
    maskLayer.frame = UIScreen.main.bounds
    maskLayer.fillColor = UIColor.black.cgColor

    // Create the frame for the circle.
    let rect = CGRect(x: center.x - radius,
                      y: center.y - radius,
                      width: 2 * radius,
                      height: 2 * radius)
    
    // Create the path.
    let path = UIBezierPath(rect: UIScreen.main.bounds)
    maskLayer.fillRule = CAShapeLayerFillRule.evenOdd

    // Append the circle to the path so that it is subtracted.
    path.append(UIBezierPath(ovalIn: rect))
    maskLayer.path = path.cgPath
    
    return maskLayer
  }
}
