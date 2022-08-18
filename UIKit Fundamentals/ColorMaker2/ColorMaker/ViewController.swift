//
//  ViewController.swift
//  ColorMaker
//
//  Created by Mauricio Paternina on 18/08/22.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var colorSwatchView: UIView!
  @IBOutlet weak var redValueSlider: UISlider!
  @IBOutlet weak var greenValueSlider: UISlider!
  @IBOutlet weak var blueValueSlider: UISlider!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Update colorSwatchView's color on launch
    updateColorSwatchView()
  }
  
  @IBAction func updateColorSwatchView() {
    let redValue: CGFloat = CGFloat(self.redValueSlider.value)
    let greenValue: CGFloat = CGFloat(self.greenValueSlider.value)
    let blueValue: CGFloat = CGFloat(self.blueValueSlider.value)
    
    colorSwatchView.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
  }

}

