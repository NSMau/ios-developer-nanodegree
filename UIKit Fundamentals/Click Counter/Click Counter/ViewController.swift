//
//  ViewController.swift
//  Click Counter
//
//  Created by Mauricio Paternina on 08/18/22.
//  Refactored by Mauricio Paternina on 09/11/23.
//

import UIKit

class ViewController: UIViewController {
  
  private var count = 0
  private let label = UILabel()
  private var buttons = UIStackView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureLabel()
    configureButtons()
    configureUI()
  }
  
  private func configureLabel() {
    label.text = "\(count)"
    label.font = .systemFont(ofSize: 48)
    label.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func configureButtons() {
    let buttonIncrement = makeButton(withTitle: "Increment")
    let buttonDecrement = makeButton(withTitle: "Decrement")
    let buttonReset = makeButton(withTitle: "Reset")
    
    buttons.addArrangedSubview(buttonIncrement)
    buttons.addArrangedSubview(buttonDecrement)
    buttons.addArrangedSubview(buttonReset)
    
    NSLayoutConstraint.activate([buttons.widthAnchor.constraint(equalToConstant: 160)])
    
    // Link actions to buttons
    buttonIncrement.addTarget(self, action: #selector(incrementCounter), for: .touchUpInside)
    buttonDecrement.addTarget(self, action: #selector(decrementCounter), for: .touchUpInside)
    buttonReset.addTarget(self, action: #selector(resetCounter), for: .touchUpInside)
    
    // Set buttonsStackView's UI-related properties
    buttons.axis = .vertical
    buttons.distribution = .equalSpacing
    buttons.alignment = .fill
    buttons.spacing = 16.0
    buttons.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func makeButton(withTitle title: String) -> UIButton {
    let button = UIButton()
    
    button.setTitle(title, for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .blue
    button.frame.size = CGSize(width: 144, height: 64)
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }
  
  private func configureUI() {
    let ui = UIStackView(arrangedSubviews: [label, buttons])
    
    ui.axis = .vertical
    ui.distribution = .equalSpacing
    ui.alignment = .center
    ui.spacing = 24.0
    ui.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(ui)
    
    NSLayoutConstraint.activate([
      ui.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      ui.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -24)
    ])
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

