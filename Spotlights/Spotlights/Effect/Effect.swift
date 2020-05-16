//
//  Effect.swift
//  Spotlights
//
//  Created by TriNgo on 5/14/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation

public protocol Effect {
  
  var duration: TimeInterval { get set }
  
  func draw()
}
