//
//  App.swift
//  thesis-ios-api
//
//  Created by Sasawat Sankosik on 13/11/2562 BE.
//  Copyright © 2562 ssankosik. All rights reserved.
//

import UIKit

struct App {
  
  static let shared = App()
  
  var appDelegate: AppDelegate? {
    return UIApplication.shared.delegate as? AppDelegate
  }
  
  var window: UIWindow? {
    return appDelegate?.window ?? nil
  }
  
}
