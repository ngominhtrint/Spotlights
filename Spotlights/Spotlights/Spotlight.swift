//
//  Spotlight.swift
//  Spotlights
//
//  Created by TriNgo on 5/14/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import UIKit

open class Spotlight: UIViewController {
  
  private var spotlight: SpotlightView!
  private var targets = [Target]()
  private var duration = TimeInterval()
  private var container: UIViewController?
  private weak var spotlightDelegate: SpotlightDelegate?
  
  private var currentIndex = Constant.Spotlight.NO_POSITION
  
  init(spotlight: SpotlightView, targets: [Target], duration: TimeInterval, container: UIViewController?, delegate: SpotlightDelegate?) {
    super.init(nibName: nil, bundle: nil)
    self.spotlight = spotlight
    self.targets = targets
    self.duration = duration
    self.container = container
    self.spotlightDelegate = delegate
  }
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  open override func viewDidLoad() {
    super.viewDidLoad()
  
    self.view.addSubview(spotlight ?? SpotlightView())
  }
  
  public func start(animated: Bool = true) {
    startSpotlight(animated: animated)
  }
  
  public func show(index: Int) {
    showTarget(index: index)
  }
  
  public func next() {
    showTarget(index: currentIndex + 1)
  }
  
  public func previous() {
    showTarget(index: currentIndex - 1)
  }
  
  public func finish(animated: Bool = false) {
    finishSpotlight(animated: animated)
  }
  
  private func startSpotlight(animated: Bool) {
    guard let container = container else { fatalError("Container can not be nil") }
    self.modalTransitionStyle = .crossDissolve
    self.modalPresentationStyle = .overFullScreen
    container.present(self, animated: animated) {
      self.spotlightDelegate?.didStart(spotlight: self)
      self.showTarget(index: 0)
    }
  }
  
  private func showTarget(index: Int) {
    if index == Constant.Spotlight.NO_POSITION || index == targets.count { return }
    
    if currentIndex == Constant.Spotlight.NO_POSITION {
      let target = targets[index]
      currentIndex = index
      spotlight.startTarget(target: target)
      target.delegate?.didTargetStart(target: target, index: currentIndex)
    } else {
      let previousTarget = targets[currentIndex]
      previousTarget.delegate?.didTargetEnd(target: previousTarget, index: currentIndex)
      
      if index < targets.count {
        let target = targets[index]
        currentIndex = index
        spotlight.startTarget(target: target)
        target.delegate?.didTargetStart(target: target, index: currentIndex)
      }
    }
  }
  
  private func finishSpotlight(animated: Bool) {
    dismiss(animated: animated) {
      self.spotlightDelegate?.didEnd(spotlight: self)
    }
  }
  
}
