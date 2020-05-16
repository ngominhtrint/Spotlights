//
//  SpotlightView.swift
//  Spotlights
//
//  Created by TriNgo on 5/14/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import UIKit

public class SpotlightView: UIView {
  
  private var target: Target?
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    makeUI()
  }
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    makeUI()
  }

  private func makeUI() {
    self.layer.masksToBounds = true
    updateUI()
  }
  
  func updateUI() {
    setNeedsLayout()
  }
  
  public func startTarget(target: Target) {
    // TODO: Remove all views
    // TODO: Add target overlay view
    // TODO: Showing target shape
  
    subviews.forEach { $0.removeFromSuperview() }

    let mask = target.shape.draw(center: target.anchor)
    
    if let overlay = target.overlay {
      self.addSubview(overlay)
      overlay.layer.mask = mask
    }
    
    // Set the mask of the view.
    layer.mask = mask
  }
  
  public func finishTarget() {
    // TODO: Hide target shape
  }
  
}
