//
//  Shape.swift
//  Spotlights
//
//  Created by TriNgo on 5/14/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import UIKit

public protocol Shape {
  
  func draw(center: CGPoint) -> CAShapeLayer
}
