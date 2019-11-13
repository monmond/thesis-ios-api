//
//  ImagePicker.swift
//  thesis-ios-api
//
//  Created by Sasawat Sankosik on 13/11/2562 BE.
//  Copyright © 2562 ssankosik. All rights reserved.
//

import UIKit

class ImagePicker {
  
  var viewController: UIViewController!
  var imagePickerController: ImagePickerController!
  
  public init(_ viewController: UIViewController, _ imagePickerController: ImagePickerController) {
    self.viewController = viewController
    self.imagePickerController = imagePickerController
  }

  func displayListSourceType() {
    let vc = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      let action = UIAlertAction(title: "Take photo", style: .default) { _ in
        self.displayCamera()
      }
      vc.addAction(action)
    }
    if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
      let action = UIAlertAction(title: "Camera roll", style: .default) { _ in
        self.displaySavedPhotosAlbum()
      }
      vc.addAction(action)
    }
    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
      let action = UIAlertAction(title: "Photo library", style: .default) { _ in
        self.displayPhotolibrary()
      }
      vc.addAction(action)
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    vc.addAction(cancelAction)
    viewController.present(vc, animated: true)
  }
  
  func displayCamera() {
    imagePickerController.sourceType = .camera
//    mediaTypes = ["public.image"]
    imagePickerController.allowsEditing = true
    viewController.present(imagePickerController, animated: true)
  }
  
  func displaySavedPhotosAlbum() {
    imagePickerController.sourceType = .savedPhotosAlbum
    imagePickerController.mediaTypes = ["public.image"]
    imagePickerController.allowsEditing = true
    viewController.present(imagePickerController, animated: true)
  }
  
  func displayPhotolibrary() {
    imagePickerController.sourceType = .photoLibrary
    imagePickerController.mediaTypes = ["public.image"]
    imagePickerController.allowsEditing = true
    viewController.present(imagePickerController, animated: true)
  }
}
