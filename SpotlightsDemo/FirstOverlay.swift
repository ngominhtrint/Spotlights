//
//  FirstOverlay.swift
//  SpotlightsDemo
//
//  Created by TriNgo on 5/16/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import UIKit

protocol FirstOverlayDelegate: class {
  
  func didClickStopSpotlightButton(overlay: FirstOverlay)
  
  func didClickNextButton(overlay: FirstOverlay)
  
  func didClickPrevButton(overlay: FirstOverlay)
  
}

class FirstOverlay: UIView {

  @IBOutlet var contentView: UIView!
  
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
  
  weak var delegate: FirstOverlayDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  func commonInit() {
    let nib = UINib(nibName: "FirstOverlay", bundle: nil)
    nib.instantiate(withOwner: self, options: nil)
    contentView.frame = bounds
    addSubview(contentView)
    
    contentView.addSubview(stopSpotlightButton)
    contentView.addSubview(nextButton)
    contentView.addSubview(prevButton)
  }
  
  @objc func onClickStopSpotlightButton() {
    delegate?.didClickStopSpotlightButton(overlay: self)
  }
  
  @objc func onClickNextButton() {
    delegate?.didClickNextButton(overlay: self)
  }
  
  @objc func onClickPrevButton() {
    delegate?.didClickPrevButton(overlay: self)
  }
  
}
