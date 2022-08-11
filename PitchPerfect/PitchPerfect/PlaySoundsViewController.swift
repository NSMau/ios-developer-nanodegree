//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Mauricio Paternina on 9/08/22.
//

import UIKit
import Foundation
import AVFAudio

class PlaySoundsViewController: UIViewController {
  @IBOutlet weak var slowEffectButton: UIButton!
  @IBOutlet weak var fastEffectButton: UIButton!
  @IBOutlet weak var highPitchEffectButton: UIButton!
  @IBOutlet weak var lowPitchEffectButton: UIButton!
  @IBOutlet weak var echoEffectButton: UIButton!
  @IBOutlet weak var reverbEffectButton: UIButton!
  @IBOutlet weak var stopPlayingButton: UIButton!
  
  var recordedAudioURL: URL!
  var audioFile: AVAudioFile!
  var audioEngine: AVAudioEngine!
  var audioPlayerNode: AVAudioPlayerNode!
  var stopTimer: Timer!
  
  enum EffectButtonType: Int {
    case slow = 0, fast, lowPitch, highPitch, echo, reverb
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupAudio()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    configureUI(.notPlaying)
  }
    
  @IBAction func playRecordingWithEffect(_ sender: UIButton) {
    switch (EffectButtonType(rawValue: sender.tag)!) {
      case .slow:
        playSound(rate: 0.5)
      
      case .fast:
        playSound(rate: 1.5)
      
      case .lowPitch:
        playSound(pitch: -1024)
      
      case .highPitch:
        playSound(pitch: 1024)
      
      case .echo:
        playSound(echo: true)
      
      case .reverb:
        playSound(reverb: true)
    }
    
    configureUI(.playing)
  }
  
  @IBAction func stopPlayingRecording(_ sender: AnyObject) {
    stopAudio()
  }
}
