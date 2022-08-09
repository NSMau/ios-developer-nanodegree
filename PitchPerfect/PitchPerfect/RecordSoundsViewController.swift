//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Mauricio Paternina on 1/08/22.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
  var audioRecorder: AVAudioRecorder!

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
  
  @IBAction func recordAudio(_ sender: Any) {
    recordingLabel.text = "Recording in Progress..."
    
    startRecordingButton.isHidden = true
    stopRecordingButton.isHidden = false
    
    let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
    let recordingName = "voice-recording.wav"
    let pathArray = [dirPath, recordingName]
    let filePath = URL(string: pathArray.joined(separator: "/"))
    
    let session = AVAudioSession.sharedInstance()
    try! session.setCategory(
      AVAudioSession.Category.playAndRecord,
      mode: AVAudioSession.Mode.default,
      options: AVAudioSession.CategoryOptions.defaultToSpeaker
    )
    
    try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
    
    // Set this ViewController as the delegate to AVAudioRecorder
    audioRecorder.delegate = self
    
    audioRecorder.isMeteringEnabled = true
    audioRecorder.prepareToRecord()
    audioRecorder.record()
  }
  
  @IBAction func stopRecording(_ sender: Any) {
    recordingLabel.text = "Tap to Record"
    
    startRecordingButton.isHidden = false
    stopRecordingButton.isHidden = true
    
    audioRecorder.stop()
    
    // Set the shared audio session to inactive
    let audioSession = AVAudioSession.sharedInstance()
    try! audioSession.setActive(false)
  }
  
  func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
    if flag {
      performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
    } else {
      print("Recording couldn't be saved. Please try again.")
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "stopRecording" {
      // Grab target View Controller and typecast it accordingly
      let playSoundsViewController = segue.destination as! PlaySoundsViewController
      let recordedAudioURL = sender as! URL
      
      playSoundsViewController.recordedAudioURL = recordedAudioURL
    }
  }
}

