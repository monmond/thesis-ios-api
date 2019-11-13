//
//  ApiRequestVC.swift
//  thesis-ios-api
//
//  Created by Sasawat Sankosik on 11/11/2562 BE.
//  Copyright © 2562 ssankosik. All rights reserved.
//

import UIKit
import SwifterSwift
import SnapKit

class ResponseVC: UIViewController {
  
  var responseString: String?
  
  let formScrollView: UIScrollView = {
    let sv = UIScrollView()
    sv.contentInsetAdjustmentBehavior = .always
    sv.setupScrollDefault()
    sv.setupScrollVertical()
    return sv
  }()
  
  let formStackView: UIStackView = {
    let stv = UIStackView()
    stv.axis = .vertical
    stv.alignment = .fill
    stv.distribution = .fillProportionally
    stv.spacing = FormConstant.verticalSpacing
    return stv
  }()
  
  let responseTextView: UITextView = {
    let textView = UITextView()
    return textView
  }()
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = String(describing: Self.self)
    view.backgroundColor = .white
    view.addSubview(formScrollView)
    formScrollView.addSubview(formStackView)
    formStackView.addArrangedSubview(responseTextView)
    formScrollView.snp.makeConstraints {
      $0.top.equalTo(view.snp.topMargin)
      $0.right.equalTo(view.snp.rightMargin)
      $0.bottom.equalTo(view.snp.bottomMargin)
      $0.left.equalTo(view.snp.leftMargin)
    }
    formStackView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.left.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.width.equalToSuperview()
      $0.height.greaterThanOrEqualToSuperview()
    }
    displayResponse()
  }
  
  func displayResponse() {
    responseTextView.text = responseString
  }
  
  func displayError(_ error: Error) {
    let alert = UIAlertController(title: "ERROR", message: error.localizedDescription)
    let action = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
    alert.addAction(action)
    self.present(alert, animated: true, completion: nil)
  }
  
}
