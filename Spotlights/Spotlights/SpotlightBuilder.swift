//
//  SpotlightBuilder.swift
//  Spotlights
//
//  Created by TriNgo on 5/14/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import UIKit

public class SpotlightBuilder {
  
  private var targets = [Target]()
  private var duration = TimeInterval()
  private var container: UIViewController?
  private weak var spotlightDelegate: SpotlightDelegate?
  
  public init() { }
 
  public func setTargets(targets: [Target]) -> SpotlightBuilder {
    self.targets = targets
    return self
  }
  
  public func setDuration(duration: TimeInterval) -> SpotlightBuilder {
    self.duration = duration
    return self
  }
  
  public func setContainer(container: UIViewController) -> SpotlightBuilder {
    self.container = container
    return self
  }
  
  public func setSpotlightDelegate(delegate: SpotlightDelegate) -> SpotlightBuilder {
    self.spotlightDelegate = delegate
    return self
  }
  
  public func build() -> Spotlight {
    guard !targets.isEmpty else { fatalError("Targets should not be nil.") }
    let spotlight = SpotlightView(frame: UIScreen.main.bounds)
    spotlight.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
    
    return Spotlight(spotlight: spotlight,
                     targets: targets,
                     duration: duration,
                     container: container,
                     delegate: spotlightDelegate)
  }
}
