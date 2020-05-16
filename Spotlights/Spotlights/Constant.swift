//
//  Constant.swift
//  Spotlights
//
//  Created by TriNgo on 5/14/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import UIKit

public class Constant {
  
  public class Target {
    public static let DEFAULT_ANCHOR = CGPoint.zero
    public static let DEFAULT_SHAPE = Circle()
    public static let DEFAULT_EFFECT = EmptyEffect(duration: TimeInterval())
  }
  
  public class Effect {
    public static let DEFAULT_DURATION = 0
  }
  
  public class Spotlight {
    public static let NO_POSITION = -1
  }
}
