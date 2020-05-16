//
//  SpotlightViewController.swift
//  SpotlightsDemo
//
//  Created by TriNgo on 5/15/20.
//  Copyright © 2020 RoverDream. All rights reserved.
//

import UIKit
import Spotlights

class SpotlightViewController: Spotlight {
  
  lazy var nextButton: UIButton = {
    let button = UIButton(frame: CGRect(x: 20, y: UIScreen.main.bounds.height - 100,
                                        width: UIScreen.main.bounds.width - 40, height: 40))
    button.setTitle("Next", for: .normal)
    button.setTitleColor(UIColor.blue, for: .normal)
    button.addTarget(self, action: #selector(onClickNextButton), for: .touchUpInside)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(nextButton)
  }
  
  @objc func onClickNextButton() {
    self.next()
  }
  
}
