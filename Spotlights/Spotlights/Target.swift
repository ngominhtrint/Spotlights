//
//  Target.swift
//  Spotlights
//
//  Created by TriNgo on 5/14/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import UIKit

public class Target {
  
  public var anchor: CGPoint
  public var shape: Shape
  public var overlay: UIView?
  public weak var delegate: TargetDelegate?
  
  init(anchor: CGPoint = Constant.Target.DEFAULT_ANCHOR,
       shape: Shape = Constant.Target.DEFAULT_SHAPE,
       overlay: UIView?,
       delegate: TargetDelegate?) {
    self.anchor = anchor
    self.shape = shape
    self.overlay = overlay
    self.delegate = delegate
  }
}


