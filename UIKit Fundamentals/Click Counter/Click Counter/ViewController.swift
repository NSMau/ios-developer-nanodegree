//
//  ViewController.swift
//  Click Counter
//
//  Created by Mauricio Paternina on 18/08/22.
//

import UIKit

class ViewController: UIViewController {
  
  var count = 0
  var label = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let label = UILabel()
    let buttonIncrement = UIButton()
    let buttonDecrement = UIButton()
    let buttonReset = UIButton()
    let buttons = UIStackView()
    let uiStack = UIStackView()
    
    self.label = label
    
    label.frame.size = CGSize(width: 64, height: 48)
    buttonIncrement.frame.size = CGSize(width: 144, height: 48)
    buttonDecrement.frame.size = CGSize(width: 144, height: 48)
    buttonReset.frame.size = CGSize(width: 144, height: 48)
    
    label.text = "0"
    label.font = UIFont.systemFont(ofSize: 24)
    
    buttonIncrement.setTitle("Increment", for: .normal)
    buttonDecrement.setTitle("Decrement", for: .normal)
    buttonReset.setTitle("Reset", for: .normal)
    
    buttonIncrement.backgroundColor = UIColor.blue
    buttonDecrement.backgroundColor = UIColor.blue
    buttonReset.backgroundColor = UIColor.blue
    
    buttonIncrement.setTitleColor(UIColor.white, for: .normal)
    buttonDecrement.setTitleColor(UIColor.white, for: .normal)
    buttonReset.setTitleColor(UIColor.white, for: .normal)
    
    // Set up stack view for the buttons and ui stacks
    buttons.axis = NSLayoutConstraint.Axis.vertical
    uiStack.axis = NSLayoutConstraint.Axis.vertical
    
    buttons.distribution = UIStackView.Distribution.equalSpacing
    uiStack.distribution = UIStackView.Distribution.equalSpacing
    
    buttons.alignment = UIStackView.Alignment.fill
    uiStack.alignment = UIStackView.Alignment.center
    
    buttons.spacing = 16.0
    uiStack.spacing = 24.0
    
    // Add buttons to the buttons stack view
    buttons.addArrangedSubview(buttonIncrement)
    buttons.addArrangedSubview(buttonDecrement)
    buttons.addArrangedSubview(buttonReset)
    
    // Add UI elements to the uiStack view
    uiStack.addArrangedSubview(label)
    uiStack.addArrangedSubview(buttons)
    
    // AutoLayout Constraints
    buttons.translatesAutoresizingMaskIntoConstraints = false
    uiStack.translatesAutoresizingMaskIntoConstraints = false
    
    // Add UI elements to the view
    view.addSubview(uiStack)
    
    // Constraints for uiStack
    uiStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    uiStack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    
    // Set constant width for buttons stack
    NSLayoutConstraint.activate([buttons.widthAnchor.constraint(equalToConstant: 160)])
    
    // Link actions to buttons
    buttonIncrement.addTarget(
      self,
      action: #selector(ViewController.incrementCounter),
      for: UIControl.Event.touchUpInside
    )
    
    buttonDecrement.addTarget(
      self,
      action: #selector(ViewController.decrementCounter),
      for: UIControl.Event.touchUpInside
    )
    
    buttonReset.addTarget(
      self,
      action: #selector(ViewController.resetCounter),
      for: UIControl.Event.touchUpInside
    )
    
  }

  @objc func incrementCounter() {
    self.count += 1
    self.label.text = "\(self.count)"
  }
  
  @objc func decrementCounter() {
    self.count -= 1
    self.label.text = "\(self.count)"
  }
  
  @objc func resetCounter() {
    self.count = 0
    self.label.text = "\(self.count)"
  }

}

