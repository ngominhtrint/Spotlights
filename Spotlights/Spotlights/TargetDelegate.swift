//
//  TargetDelegate.swift
//  Spotlights
//
//  Created by TriNgo on 5/14/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation

public protocol TargetDelegate: class {
  
  func didTargetStart(target: Target, index: Int)
  
  func didTargetEnd(target: Target, index: Int)
}
