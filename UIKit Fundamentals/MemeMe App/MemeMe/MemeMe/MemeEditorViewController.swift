//
//  MemeEditorViewController.swift
//  MemeMe
//
//  Created by Mauricio Paternina on 1/09/22.
//

import Foundation
import UIKit

class MemeEditorViewController: UIViewController, UITextFieldDelegate {
  
  // MARK: Outlets
  @IBOutlet weak var memeEditorNavigationBar: UINavigationBar!
  @IBOutlet weak var memeEditingCancelButton: UIBarButtonItem!
  @IBOutlet weak var memeEditingDoneButton: UIBarButtonItem!
  @IBOutlet weak var memeImageCanvas: UIImageView!
  @IBOutlet weak var memeTopText: UITextField!
  @IBOutlet weak var memeBottomText: UITextField!
  
  
  // MARK: Properties
  var meme = AppModel.Meme()
  var memeUneditedImage: UIImage?
  var memeArtwork: UIImage?
  
  
  // MARK: Text Fields' Delegates
  let memeTopTextFieldDelegate = MemeTextFieldDelegate()
  let memeBottomTextFieldDelegate = MemeTextFieldDelegate()
  
  
  // MARK: Lifecycle
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    memeImageCanvas.image = memeUneditedImage!
    
    // Resize pickedImageCanvas to fit pickedImage
    view.layoutIfNeeded()
    
    observeKeyboardNotifications()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    initMemeTextFields([memeTopText, memeBottomText])
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    unobserveKeyboardNotifications()
  }
  
  
  // MARK: Set default text attributes
  
  /// Sets up the meme's top and bottom text fields' initial configuration
  func initMemeTextFields(_ textFields: [UITextField]) {
    
    for (_, textField) in textFields.enumerated() {
      
      textField.delegate =
        textField.tag == 0 ? memeTopTextFieldDelegate : memeBottomTextFieldDelegate
      
      textField.defaultTextAttributes = AppModel.textFieldDefaultTextAttributes
      textField.textAlignment = .center
      
      textField.text = textField.tag == 0
        ? AppModel.topTextFieldPlaceholder : AppModel.bottomTextFieldPlaceholder
      
    }
    
  }
  
    
  // MARK: Actions
  
  /// Dismisses the Meme Editor scene and goes back to the Home view
  @IBAction private func cancelMemeEditing() {
    let alert = UIAlertController(
      title: "Do you really want to cancel editing this meme?",
      message: nil,
      preferredStyle: .alert
    )
    
    alert.addAction(UIAlertAction(title: "Yes, cancel", style: .default) { (action: UIAlertAction!) in
      self.dismiss(animated: true, completion: nil)
    })
    
    alert.addAction(UIAlertAction(title: "Keep editing", style: .default) { (action: UIAlertAction!) in
      alert.dismiss(animated: true, completion: nil)
    })
    
    present(alert, animated: true, completion: nil)
  }
  
  
  /// Handles the case when the user is done editing the meme
  @IBAction private func handleDoneMemeEditing() {
    generateMeme()
  }
  
  
  private func generateMeme() {
    
    if memeTopText.text!.lowercased() == AppModel.topTextFieldPlaceholder.lowercased()
        || memeBottomText.text!.lowercased() == AppModel.bottomTextFieldPlaceholder.lowercased() {
      alertMissingMemeText()
    }
      
    let meme = AppModel.Meme(
      image: memeUneditedImage!,
      artwork: generateMemeArtwork(),
      text: AppModel.MemeText(
        top: memeTopText.text!,
        bottom: memeBottomText.text!
      ),
      title: "mememe-artwork-\(Date())",
      createdAt: Date()
    )
    
    // Share meme
    shareMeme(meme)
    
  }
  
  /// Returns the final meme image, represented as a `UIImage` with the overlaying text
  private func generateMemeArtwork() -> UIImage {
    memeEditorNavigationBar.isHidden = true
    
    // Create context with meme artwork's size
    UIGraphicsBeginImageContext(memeImageCanvas.frame.size)
    
    // Move to meme artwork's position
    let context = UIGraphicsGetCurrentContext()

    context!.translateBy(x: 0.0, y: -44.0)
    
    // Capture snapshot of the meme artwork
    view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
    
    let memeArtwork: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    
    UIGraphicsEndImageContext()
    
    memeEditorNavigationBar.isHidden = false
    
    return memeArtwork
  }
  
  /// Displays  an `UIAlertController` informing the user to edit the meme's text fields' placeholders
  private func alertMissingMemeText() {
    let alert = UIAlertController(
      title: "Make sure to add some custom text to your meme.",
      message: nil,
      preferredStyle: .alert
    )
    
    alert.addAction(UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction!) in
      alert.dismiss(animated: true, completion: nil)
    })
    
    present(alert, animated: true, completion: nil)
  }
  
  
  private func shareMeme(_ meme: AppModel.Meme) {
    let controller = UIActivityViewController(activityItems: [meme.artwork! as UIImage], applicationActivities: nil)
    
    controller.completionWithItemsHandler = { (activityType, completed, returnedItems, activityError) -> () in
      if (completed) {
//        self.saveMemeToLibrary(meme)
        self.dismiss(animated: true, completion: nil)
      }
    }
    
    present(controller, animated: true, completion: nil)
  }
  
  
//  private func saveMemeToLibrary(_ meme: AppModel.Meme) {
//    print("=========== Started to save meme to library ===========")
//    (UIApplication.shared.delegate as! AppDelegate).memeLibrary.append(meme)
//    print("=========== Finished saving meme to library ===========")
//  }
  
  
  // MARK: Keyboard Utils
  
  func observeKeyboardNotifications() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillShow),
      name: UIResponder.keyboardWillShowNotification,
      object: nil
    )
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillHide),
      name: UIResponder.keyboardWillHideNotification,
      object: nil
    )
  }
  
  func unobserveKeyboardNotifications() {
    NotificationCenter.default.removeObserver(
      self,
      name: UIResponder.keyboardWillShowNotification,
      object: nil
    )
    
    NotificationCenter.default.removeObserver(
      self,
      name: UIResponder.keyboardWillHideNotification,
      object: nil
    )
  }
  
  /// Shifts view up when bottom textField is being edited only
  @objc func keyboardWillShow(_ notification: NSNotification) {
    
    if memeBottomText.isEditing {
      view.frame.origin.y = -getKeyboardHeight(notification as Notification)!
    }
    
  }
  
  /// Restores view position to its original y coordinate
  @objc func keyboardWillHide(_ notification: NSNotification) {
    view.frame.origin.y = 0
  }
  
  /// Returns the height of the keyboard if successfully calculated
  func getKeyboardHeight(_ notification: Notification) -> CGFloat? {
    guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?
      .cgRectValue else { return nil }
    
    return keyboardSize.height
  }
  
}
