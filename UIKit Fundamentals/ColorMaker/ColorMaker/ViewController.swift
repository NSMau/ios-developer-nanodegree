//
//  ViewController.swift
//  ColorMaker
//
//  Created by Mauricio Paternina on 18/08/22.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var colorSwatchView: UIView!
  @IBOutlet weak var redColorSwitch: UISwitch!
  @IBOutlet weak var greenColorSwitch: UISwitch!
  @IBOutlet weak var blueColorSwitch: UISwitch!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Update colorSwatchView's color on launch
    updateColorSwatchView()
  }
  
  @IBAction func updateColorSwatchView() {
    let redValue: CGFloat = self.redColorSwitch.isOn ? 1 : 0
    let greenValue: CGFloat = self.greenColorSwitch.isOn ? 1 : 0
    let blueValue: CGFloat = self.blueColorSwitch.isOn ? 1 : 0
    
    colorSwatchView.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
  }


}

