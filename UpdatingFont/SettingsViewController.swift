//
//  SettingsViewController.swift
//  UpdatingFont
//
//  Created by Alex Paul on 11/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  
  @IBOutlet weak var messageLabel: UILabel!
  @IBOutlet weak var sizeLabel: UILabel!
  @IBOutlet weak var sliderControl: UISlider!
  @IBOutlet weak var stepperControl: UIStepper!
  
  private var currentFontSize: Float = 17 {
    didSet {
      messageLabel.font = UIFont.systemFont(ofSize: CGFloat(currentFontSize))
      sizeLabel.text = String(format: "%.0f", currentFontSize)
      defaultFontSize = currentFontSize
      sliderControl.value = currentFontSize
      stepperControl.value = Double(currentFontSize)
    }
  }
  
  var defaultFontSize: Float = 17
  
  override func viewDidLoad() {
    super.viewDidLoad()
    currentFontSize = defaultFontSize
  }
  
  @IBAction func sliderChanged(_ sender: UISlider) {
    currentFontSize = sender.value
  }
  
  @IBAction func stepperChanged(_ sender: UIStepper) {
     currentFontSize = Float(sender.value)
  }
}
