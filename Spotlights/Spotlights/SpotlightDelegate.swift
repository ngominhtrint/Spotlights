//
//  SpotlightDelegate.swift
//  Spotlights
//
//  Created by TriNgo on 5/14/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import Foundation

public protocol SpotlightDelegate: class {
  
  func didStart(spotlight: Spotlight)
  
  func didEnd(spotlight: Spotlight)
}
