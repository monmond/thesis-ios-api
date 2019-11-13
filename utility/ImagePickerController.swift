//
//  ImagePickerController.swift
//  rtspplayer
//
//  Created by Sasawat Sankosik on 12/11/2562 BE.
//  Copyright © 2562 Sasawat Sankosik. All rights reserved.
//

import UIKit

extension ImagePickerController:
  UIImagePickerControllerDelegate,
  UINavigationControllerDelegate
{
  
}

class ImagePickerController: UIImagePickerController {
  
  var didFinishPickingMedia: (([UIImagePickerController.InfoKey : Any]?) -> ())?

  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    delegate = self
  }
  
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    didFinishPickingMedia?(info)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    didFinishPickingMedia?(nil)
  }
  
}
