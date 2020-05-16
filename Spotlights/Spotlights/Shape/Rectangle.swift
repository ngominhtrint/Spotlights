//
//  Rectangle.swift
//  Spotlights
//
//  Created by TriNgo on 5/15/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import UIKit

public class Rectangle: Shape {
  
  public var width: CGFloat
  public var height: CGFloat
  public var byRoundingCorners: UIRectCorner
  public var cornerRadius: CGSize
  
  public init(width: CGFloat, height: CGFloat,
              byRoundingCorners: UIRectCorner = .allCorners,
              cornerRadius: CGFloat = 0.0) {
    self.width = width
    self.height = height
    self.byRoundingCorners = byRoundingCorners
    self.cornerRadius = CGSize(width: cornerRadius, height: cornerRadius)
  }
  
  public func draw(center: CGPoint) -> CAShapeLayer {
    // Create the initial layer from the view bounds.
    let maskLayer = CAShapeLayer()
    maskLayer.frame = UIScreen.main.bounds
    maskLayer.fillColor = UIColor.black.cgColor
    
    // Create the frame for the rectangle
    let rect = CGRect(x: center.x - width/2, y: center.y - height/2,
                      width: width, height: height)
    
    // Create the path
    let path = UIBezierPath(rect: UIScreen.main.bounds)
    maskLayer.fillRule = CAShapeLayerFillRule.evenOdd
    
    // Append the rectangle to the path so that it is subtracted
    path.append(UIBezierPath(roundedRect: rect,
                             byRoundingCorners: byRoundingCorners,
                             cornerRadii: cornerRadius))
    maskLayer.path = path.cgPath
    
    return maskLayer
  }
}
