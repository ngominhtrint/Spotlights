//
//  EmptyEffect.swift
//  Spotlights
//
//  Created by TriNgo on 5/14/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation

public class EmptyEffect: Effect {
  
  // Override from Effect protocol
  public var duration: TimeInterval
  
  init(duration: TimeInterval) {
    self.duration = duration
  }
  
  // Override from Effect protocol
  public func draw() {
    
  }
}
