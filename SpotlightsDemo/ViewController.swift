//
//  ViewController.swift
//  SpotlightsDemo
//
//  Created by TriNgo on 5/14/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import UIKit
import Spotlights

class ViewController: UIViewController {

  lazy var contentView: UIView = {
    let view = UIView(frame: UIScreen.main.bounds)
    view.backgroundColor = UIColor(red: 222/255, green: 128/255, blue: 255/255, alpha: 1.0)
    return view
  }()
  
  lazy var numberOneLabel: UILabel = {
    let label = UILabel(frame: CGRect(x: 100, y: 100, width: 60, height: 40))
    label.textAlignment = .center
    label.text = "One"
    return label
  }()
  
  lazy var numberTwoLabel: UILabel = {
    let label = UILabel(frame: CGRect(x: 350, y: 300, width: 60, height: 40))
    label.textAlignment = .center
    label.text = "Two"
    return label
  }()
  
  lazy var numberThreeLabel: UILabel = {
    let label = UILabel(frame: CGRect(x: 20, y: 500, width: 60, height: 40))
    label.textAlignment = .center
    label.text = "Three"
    return label
  }()
  
  lazy var startSpotlightButton: UIButton = {
    let button = UIButton(frame: CGRect(x: 20, y: UIScreen.main.bounds.height - 100,
                                        width: UIScreen.main.bounds.width - 40, height: 40))
    button.backgroundColor = .white
    button.setTitle("Start Spotlight", for: .normal)
    button.setTitleColor(UIColor.blue, for: .normal)
    button.setTitleColor(UIColor.darkGray, for: .highlighted)
    button.addTarget(self, action: #selector(onClickStartSpotlightButton), for: .touchUpInside)
    return button
  }()
  
  lazy var stopSpotlightButton: UIButton = {
    let button = UIButton(frame: CGRect(x: 20, y: UIScreen.main.bounds.height - 160,
                                        width: UIScreen.main.bounds.width - 40, height: 40))
    button.backgroundColor = .white
    button.setTitle("Stop Spotlight", for: .normal)
    button.setTitleColor(UIColor.blue, for: .normal)
    button.setTitleColor(UIColor.darkGray, for: .highlighted)
    button.addTarget(self, action: #selector(onClickStopSpotlightButton), for: .touchUpInside)
    return button
  }()
  
  lazy var nextButton: UIButton = {
    let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height - 100,
                                        width: UIScreen.main.bounds.width/2 - 20, height: 40))
    button.backgroundColor = .white
    button.setTitle("Next", for: .normal)
    button.setTitleColor(UIColor.blue, for: .normal)
    button.setTitleColor(UIColor.darkGray, for: .highlighted)
    button.addTarget(self, action: #selector(onClickNextButton), for: .touchUpInside)
    return button
  }()
  
  lazy var prevButton: UIButton = {
    let button = UIButton(frame: CGRect(x: 20, y: UIScreen.main.bounds.height - 100,
                                        width: UIScreen.main.bounds.width/2 - 40, height: 40))
    button.backgroundColor = .white
    button.setTitle("Prev", for: .normal)
    button.setTitleColor(UIColor.blue, for: .normal)
    button.setTitleColor(UIColor.darkGray, for: .highlighted)
    button.addTarget(self, action: #selector(onClickPrevButton), for: .touchUpInside)
    return button
  }()
  
  lazy var firstOverlay: FirstOverlay = {
    let view = FirstOverlay(frame: UIScreen.main.bounds)
    view.delegate = self
    return view
  }()
  
  var spotlight: Spotlight?
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    super.init(nibName: nil, bundle: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    contentView.addSubview(startSpotlightButton)
    [numberOneLabel, numberTwoLabel, numberThreeLabel]
      .forEach { contentView.addSubview($0) }
    self.view.addSubview(contentView)
  }
  
  @objc func onClickStartSpotlightButton() {
    
    // Create sample overlay view
    let overlay = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    overlay.addSubview(prevButton)
    overlay.addSubview(nextButton)
    overlay.addSubview(stopSpotlightButton)
    
    // Create first target as Rectangle shape & apply on numberOneLabel
    // Use FirstOverlay (customize view by xib) as overlay view
    let firstTarget = TargetBuilder()
      .setAnchor(view: numberOneLabel)
      .setShape(shape: Rectangle(width: 100, height: 40, cornerRadius: 8.0))
      .setOverlay(overlay: firstOverlay)
      .setDelegate(delegate: self)
      .build()

    // Create second target as Circle shape & apply on numberTwoLabel
    let secondTarget = TargetBuilder()
      .setAnchor(view: numberTwoLabel)
      .setShape(shape: Circle(radius: 40))
      .setOverlay(overlay: overlay)
      .setDelegate(delegate: self)
      .build()

    // Create third target as Circle shape & apply on numberThreeLabel
    let thirdTarget = TargetBuilder()
      .setAnchor(view: numberThreeLabel)
      .setShape(shape: Circle(radius: 80))
      .setOverlay(overlay: overlay)
      .setDelegate(delegate: self)
      .build()
    
    // Create spotlight with an array of targets
    // Set container as current UIViewController
    spotlight = SpotlightBuilder()
      .setTargets(targets: [firstTarget, secondTarget, thirdTarget])
      .setContainer(container: self)
      .setSpotlightDelegate(delegate: self)
      .build()

    /*
     * TODO: Create a bunch of similar property targets & apply on all views
     
    let targets = [numberOneLabel, numberTwoLabel, numberThreeLabel].map {
      return TargetBuilder()
        .setAnchor(view: $0)
        .setShape(shape: Circle(radius: 80))
        .setOverlay(overlay: overlay)
        .setDelegate(delegate: self)
        .build()
    }

    spotlight = SpotlightBuilder()
    .setTargets(targets: targets)
    .setContainer(container: self)
    .setSpotlightDelegate(delegate: self)
    .build()
     
     */
    
    // After all, let start spotlight
    spotlight?.start()
  }
  
  @objc func onClickStopSpotlightButton() {
    // Stop spotlight
    spotlight?.finish()
  }
  
  @objc func onClickNextButton() {
    // Go to next target
    spotlight?.next()
  }
  
  @objc func onClickPrevButton() {
    // Go to previous
    spotlight?.previous()
  }
}

// MARK: TargetDelegate methods
extension ViewController: TargetDelegate {
  func didTargetStart(target: Target, index: Int) {
    print("TargetDelegate didTargetStart, index: \(index)")
  }
  
  func didTargetEnd(target: Target, index: Int) {
    print("TargetDelegate didTargetEnd, index: \(index)")
  }
}

// MARK: SpotlightDelegate methods
extension ViewController: SpotlightDelegate {
  func didStart(spotlight: Spotlight) {
    print("SpotlightDelegate didStart")
  }
  
  func didEnd(spotlight: Spotlight) {
    print("SpotlightDelegate didEnd")
  }
}

// MARK: FirstOverlayDelegate methods
extension ViewController: FirstOverlayDelegate {
  
  func didClickStopSpotlightButton(overlay: FirstOverlay) {
    spotlight?.finish()
  }
  
  func didClickNextButton(overlay: FirstOverlay) {
    spotlight?.next()
  }
  
  func didClickPrevButton(overlay: FirstOverlay) {
    
  }
}
