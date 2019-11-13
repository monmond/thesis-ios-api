//
//  UIScrollViewExtensions.swift
//  thesis-ios-api
//
//  Created by Sasawat Sankosik on 12/11/2562 BE.
//  Copyright © 2562 ssankosik. All rights reserved.
//

import UIKit

extension UIScrollView {
  
  func setupScrollDefault() {
    isScrollEnabled = false
    showsHorizontalScrollIndicator = false
    showsVerticalScrollIndicator = false
    bounces = false
    alwaysBounceVertical = false
    alwaysBounceHorizontal = false
  }
  
  func setupScrollHorizontal() {
    alwaysBounceHorizontal = true
    showsHorizontalScrollIndicator = false
  }
  
  func setupScrollVertical() {
    isScrollEnabled = true
    showsVerticalScrollIndicator = true
    bounces = true
    alwaysBounceVertical = true
  }

}
