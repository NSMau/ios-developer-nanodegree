//
//  AppModel.swift
//  MemeMe
//
//  Created by Mauricio Paternina on 31/08/22.
//

import UIKit

struct AppModel {
  static var textFieldDefaultTextAttributes: [NSAttributedString.Key: Any] = [
    .font: UIFont(name: "Impact", size: 32)!,
    .tracking: 2,
    .paragraphStyle: getParagraphStyle(),
    .strokeColor: UIColor.black,
    .strokeWidth: -3.0,
    .foregroundColor: UIColor.white
  ]
  
  static var topTextFieldPlaceholder = "TOP TEXT"
  static var bottomTextFieldPlaceholder = "BOTTOM TEXT"
  
  static var isLandscapeMode = false
  
  static func getParagraphStyle () -> NSMutableParagraphStyle {
    let _paragraphStyle = NSMutableParagraphStyle()
    
    _paragraphStyle.alignment = .center
    
    return _paragraphStyle
  }
  
  static func getDeviceOrientation() {
    if UIDevice.current.orientation.isLandscape {
      isLandscapeMode = true
    } else {
      isLandscapeMode = false
    }
  }
  
  static func respondToLandscapeOrientation(effect: () -> Void) {
    getDeviceOrientation()
    effect()
  }
  
  // MARK: Meme
  
  struct Meme {
    var image: UIImage? = nil
    var artwork: UIImage? = nil
    var text = MemeText()
    var title = "Untitled"
    var createdAt = Date()
    
    init() {}
    
    init(image: UIImage, artwork: UIImage, text: MemeText, title: String, createdAt: Date) {
      self.image = image
      self.artwork = artwork
      self.text = text
      self.title = title
      self.createdAt = createdAt
    }
  }
  
  struct MemeText {
    var top = "", bottom = ""
    
    init() {}
    
    init(top: String, bottom: String) {
      self.top = top
      self.bottom = bottom
    }
  }
}
