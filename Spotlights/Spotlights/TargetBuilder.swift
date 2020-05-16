//
//  TargetBuilder.swift
//  Spotlights
//
//  Created by TriNgo on 5/14/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import UIKit

public class TargetBuilder {
  
  private var anchor: CGPoint = Constant.Target.DEFAULT_ANCHOR
  private var shape: Shape = Constant.Target.DEFAULT_SHAPE
  private var overlay: UIView?
  private weak var delegate: TargetDelegate?
  
  public init() { }
  
  public func setAnchor(view: UIView) -> TargetBuilder {
    self.anchor = view.center
    return self
  }
  
  public func setAnchor(x: CGFloat, y: CGFloat) -> TargetBuilder {
    self.anchor = CGPoint(x: x, y: y)
    return self
  }
  
  public func setAnchor(anchor: CGPoint) -> TargetBuilder {
    self.anchor = anchor
    return self
  }
  
  public func setShape(shape: Shape) -> TargetBuilder {
    self.shape = shape
    return self
  }
  
  public func setOverlay(overlay: UIView) -> TargetBuilder {
    self.overlay = overlay
    return self
  }
  
  public func setDelegate(delegate: TargetDelegate) -> TargetBuilder {
    self.delegate = delegate
    return self
  }
  
  public func build() -> Target {
    return Target(anchor: anchor,
                  shape: shape,
                  overlay: overlay,
                  delegate: delegate)
  }
}
