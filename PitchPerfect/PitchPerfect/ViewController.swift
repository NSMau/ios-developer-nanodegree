//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Mauricio Paternina on 1/08/22.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var recordingLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func recordAudio(_ sender: Any) {
    print("The Record button has been pressed!")
    recordingLabel.text = "Recording in Progres..."
  }
  
  @IBAction func stopRecording(_ sender: Any) {
    print("The Stop Recording button has been pressed!")
  }
}

