//
//  MemeEditorViewController.swift
//  MemeMe
//
//  Created by Mauricio Paternina on 30/08/22.
//

import UIKit

/// `UIImagePickerControllerDelegate` — A set of methods that the delegate
/// object must implement to interact with the image picker interface.
///
/// To be a delegate of the `UIImagePickerController`, `ViewController`  also
/// needs to conform to the `UINavigationControllerDelegate` protocol.
class HomeViewController:
  UIViewController,
  UIImagePickerControllerDelegate,
  UINavigationControllerDelegate {
  
  // MARK: Outlets
  @IBOutlet weak var emptyState: UIStackView!
  @IBOutlet weak var emptyStateIllustration: UIImageView!
  @IBOutlet weak var memeGallery: UIStackView!
  @IBOutlet weak var imagePickerToolbar: UIToolbar!
  @IBOutlet weak var photoLibraryButton: UIBarButtonItem!
  @IBOutlet weak var cameraButton: UIBarButtonItem!
  
  
  // MARK: State

  var memeLibrary: [AppModel.Meme] = []
  
  
  // MARK: Lifecycle

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    setMemeGalleryView(memeLibrary)
    
    // Disable the Camera button if the device being used doesn't have a camera
    cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    
    AppModel.respondToLandscapeOrientation(effect: respondToOrientation)
  }
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    
    AppModel.respondToLandscapeOrientation(effect: respondToOrientation)
  }
  
  
  // MARK: UIImagePickerController
  
  /// Returns a modal view of an `UIImagePickerController` to pick an image.
  /// The image can be selected from Photo Library or Camera.
  ///
  /// It dynamically assigns the controller's source type  depending  on the
  /// sender that was pressed.
  ///
  /// - Parameter `sender`: `UIBarButtonItem` to be pressed.
  @IBAction func pickImage(_ sender: UIBarButtonItem) {
    let imagePicker = UIImagePickerController()
    let imagePickerSourceType: UIImagePickerController.SourceType = sender.tag == 0 ? .photoLibrary : .camera
    
    // Set the delegate
    imagePicker.delegate = self
    
    imagePicker.sourceType = imagePickerSourceType
    
    present(imagePicker, animated: true, completion: nil)
  }
  
  
  // MARK: UIImagePickerControllerDelegate Methods
  
  /// Handles the selection of an image
  ///
  /// Since the presentation of the `imagePickerController`is not complete by
  /// the time `memeEditorViewController` will be presented, we add the target
  /// controller to the main thread, so it  waits for the current controller's
  /// presentation to complete before attempting to present.
  func imagePickerController(
    _ picker: UIImagePickerController,
    didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
  ) {
    if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      
      if let presentedViewController = self.presentedViewController {
        presentedViewController.removeFromParent()
      }
      
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let memeEditorViewController = storyboard.instantiateViewController(
        withIdentifier: "MemeEditorViewController"
      ) as! MemeEditorViewController
      
      memeEditorViewController.memeUneditedImage = pickedImage
      
      memeEditorViewController.view.translatesAutoresizingMaskIntoConstraints = false
      
      DispatchQueue.main.async {
        self.present(
          memeEditorViewController,
          animated: true,
          completion: nil
        )
      }
    }
    
    dismiss(animated: true, completion: nil)
  }
  
  
  // MARK: Utils
  
  /// Determines whether to display an empty state or an existing meme gallery,
  /// should such gallery exist.
  ///
  /// - `Parameter` `library`: The meme gallery, an array of `AppModel.Meme`s
  func setMemeGalleryView(_ library: [AppModel.Meme]) {
    if library.isEmpty {
      emptyState.isHidden = false
      // memeGallery.isHidden = true
    } else {
      emptyState.isHidden = true
      // memeGallery.isHidden = false
    }
  }
  
  /// Applies the corresponding visual changes according to the current device orientation
  func respondToOrientation() {
    
    if AppModel.isLandscapeMode {
      emptyStateIllustration.isHidden = true
    } else {
      emptyStateIllustration.isHidden = false
    }
    
  }

}

