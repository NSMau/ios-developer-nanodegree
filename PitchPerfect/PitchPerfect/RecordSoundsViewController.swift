//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Mauricio Paternina on 1/08/22.
//

import UIKit

class RecordSoundsViewController: UIViewController {

  @IBOutlet weak var startRecordingButton: UIButton!
  @IBOutlet weak var stopRecordingButton: UIButton!
  @IBOutlet weak var recordingLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    stopRecordingButton.isHidden = true
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    print("Hello, world!")
  }

  @IBAction func recordAudio(_ sender: Any) {
    recordingLabel.text = "Recording in Progress..."
    startRecordingButton.isHidden = true
    stopRecordingButton.isHidden = false
  }
  
  @IBAction func stopRecording(_ sender: Any) {
    recordingLabel.text = "Tap to Record"
    startRecordingButton.isHidden = false
    stopRecordingButton.isHidden = true
  }
}

