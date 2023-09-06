//
//  MYOAViewController.swift
//  MYOA
//
//  Created by Mauricio Paternina on 7/10/22.
//

import UIKit

class MYOAViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      title: "Start Over",
      style: .plain,
      target: self,
      action: #selector(MYOAViewController.startOver)
    )
  }
  
  @objc func startOver() {
    if navigationController == self.navigationController {
      navigationController!.popToRootViewController(animated: true)
    }
  }

}

