//
//  RequestVC.swift
//  rtspplayer
//
//  Created by Sasawat Sankosik on 12/11/2562 BE.
//  Copyright © 2562 Sasawat Sankosik. All rights reserved.
//

import UIKit
import SwifterSwift
import SnapKit

class RequestVC: UIViewController {
  
  var routeSelected: ApiRoutesTVC.Routes? = nil
  var imageSelected: UIImage?
  
  let formScrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.contentInsetAdjustmentBehavior = .always
    scrollView.setupScrollDefault()
    scrollView.setupScrollVertical()
    return scrollView
  }()
  
  let formStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.distribution = .fill
    stackView.spacing = FormConstant.verticalSpacing
    return stackView
  }()
  
  let routeButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitleColor(.black, for: [])
    button.sizeToFit()
    return button
  }()
  
  let idTextField: UITextField = {
    let textField = UITextField()
    textField.setupDefault()
    return UITextField()
  }()
  
  let nameTextField: UITextField = {
    let textField = UITextField()
    textField.setupName()
    return UITextField()
  }()
  
  let ageTextField: UITextField = {
    let textField = UITextField()
    textField.setupDefault()
    return UITextField()
  }()
  
  let imageButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitleColor(.black, for: [])
    button.sizeToFit()
    return button
  }()
  
  let requestButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitleColor(.black, for: [])
    button.sizeToFit()
    return button
  }()
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = String(describing: Self.self)
    view.backgroundColor = .white
    routeButton.setTitle("select route", for: [])
    routeButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
    idTextField.placeholder = "id"
    nameTextField.placeholder = "name"
    ageTextField.placeholder = "age"
    imageButton.setTitle("profile image", for: [])
    imageButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
    requestButton.setTitle("request", for: [])
    requestButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
    view.addSubview(formScrollView)
    formScrollView.addSubview(formStackView)
    formStackView.addArrangedSubview(routeButton)
    formStackView.addArrangedSubview(idTextField)
    formStackView.addArrangedSubview(nameTextField)
    formStackView.addArrangedSubview(ageTextField)
    formStackView.addArrangedSubview(imageButton)
    formStackView.addArrangedSubview(requestButton)
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
      $0.height.lessThanOrEqualToSuperview()
    }
    routeButton.snp.makeConstraints {
      $0.height.equalTo(FormConstant.buttonHeight)
    }
    idTextField.snp.makeConstraints {
      $0.height.equalTo(FormConstant.textFieldHeight)
    }
    nameTextField.snp.makeConstraints {
      $0.height.equalTo(FormConstant.buttonHeight)
    }
    ageTextField.snp.makeConstraints {
      $0.height.equalTo(FormConstant.buttonHeight)
    }
    imageButton.snp.makeConstraints {
      $0.height.equalTo(FormConstant.buttonHeight)
    }
    requestButton.snp.makeConstraints {
      $0.height.equalTo(FormConstant.buttonHeight)
    }
  }
  
  @objc func buttonTouchUpInside(_ sender: UIButton) {
    switch sender {
    case routeButton:
      displayRouteList()
    case imageButton:
      displayImagePicker()
    case requestButton:
      routeRequest()
    default:
      break
    }
  }
  
  func displayRouteList() {
    let vc = ApiRoutesTVC()
    vc.didSelectRowAt = ({ route in
      self.routeSelected = route
      DispatchQueue.main.async {
        self.routeButton.setTitle(route.rawValue, for: [])
      }
      self.navigationController?.popViewController(animated: true)
    })
    navigationController?.pushViewController(vc, animated: true)
  }
  
  func displayImagePicker() {
    let vc = ImagePickerController()
    vc.didFinishPickingMedia = ({ info in
      self.imageSelected = info?[.editedImage] as? UIImage
      DispatchQueue.main.async {
        self.imageButton.setTitle(Date().timeString(), for: [])
      }
      vc.dismiss(animated: true)
    })
    let imagePicker = ImagePicker(self, vc)
    imagePicker.displayListSourceType()
  }
  
  func displayResponse(_ responseString: String?) {
    let vc = ResponseVC()
    vc.responseString = responseString
    navigationController?.pushViewController(vc, animated: true)
  }
  
  func displayError(_ error: Error) {
    let alert = UIAlertController(title: "ERROR", message: error.localizedDescription)
    let action = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
    alert.addAction(action)
    self.present(alert, animated: true, completion: nil)
  }
  
  func routeRequest() {
    do {
      let route = try routeSelected.unwrapped(or: AppError.inputWrongOrMissing)
      switch route {
      case .listMonmonds:
        try listMonmondsRequest()
      case .viewMonmond:
        try viewMonmondRequest()
      case .insertMonmond:
        try insertMonmondRequest()
      case .updateMonmond:
        try updateMonmondRequest()
      case .deleteMonmond:
        try deleteMonmondRequest()
      case .transactionMonmond:
        try transactionMonmondRequest()
      case .uploadMonmond:
        try uploadMonmondRequest()
      }
    } catch let e {
      displayError(e)
    }
  }
  
  func listMonmondsRequest() throws {
    Api.listMonmonds({ result in
      switch result {
      case let .success(object):
        let json = try? DictionaryEncoder().encode(object)
        self.displayResponse(json?.jsonString(prettify: true))
      case let .failure(e):
        self.displayError(e)
      }
    })
  }
  
  func viewMonmondRequest() throws {
    let id = (idTextField.text ?? "").int ?? 0
    guard id != 0 else {
      throw AppError.inputWrongOrMissing
    }
    let p = ViewMonmondApiParameter(id: 1)
    Api.viewMonmond(p, { result in
      switch result {
      case let .success(object):
        let json = try? DictionaryEncoder().encode(object)
        self.displayResponse(json?.jsonString(prettify: true))
      case let .failure(e):
        self.displayError(e)
      }
    })
  }
  
  func insertMonmondRequest() throws {
    let name = nameTextField.text ?? ""
    let age = (ageTextField.text ?? "").int ?? 0
    guard name.count > 0 else {
      throw AppError.inputWrongOrMissing
    }
    guard age != 0 else {
      throw AppError.inputWrongOrMissing
    }
    let p = InsertMonmondApiParameter(name: name, age: age)
    Api.insertMonmond(p, { result in
      switch result {
      case let .success(object):
        let json = try? DictionaryEncoder().encode(object)
        self.displayResponse(json?.jsonString(prettify: true))
      case let .failure(e):
        self.displayError(e)
      }
    })
  }
  
  func updateMonmondRequest() throws {
    let name = nameTextField.text ?? ""
    let age = (ageTextField.text ?? "").int ?? 0
    guard name.count > 0 else {
      throw AppError.inputWrongOrMissing
    }
    guard age != 0 else {
      throw AppError.inputWrongOrMissing
    }
    let p = UpdateMonmondApiParameter(name: name, age: age)
    Api.updateMonmond(p, { result in
      switch result {
      case let .success(object):
        let json = try? DictionaryEncoder().encode(object)
        self.displayResponse(json?.jsonString(prettify: true))
      case let .failure(e):
        self.displayError(e)
      }
    })
  }
  
  func deleteMonmondRequest() throws {
    let name = nameTextField.text ?? ""
    let age = (ageTextField.text ?? "").int ?? 0
    guard name.count > 0 else {
      throw AppError.inputWrongOrMissing
    }
    guard age != 0 else {
      throw AppError.inputWrongOrMissing
    }
    let p = DeleteMonmondApiParameter(name: name, age: age)
    Api.deleteMonmond(p, { result in
      switch result {
      case let .success(object):
        let json = try? DictionaryEncoder().encode(object)
        self.displayResponse(json?.jsonString(prettify: true))
      case let .failure(e):
        self.displayError(e)
      }
    })
  }
  
  func transactionMonmondRequest() throws {
    let name = nameTextField.text ?? ""
    let age = (ageTextField.text ?? "").int ?? 0
    guard name.count > 0 else {
      throw AppError.inputWrongOrMissing
    }
    guard age != 0 else {
      throw AppError.inputWrongOrMissing
    }
    let p = TransactionMonmondApiParameter(name: name, age: age)
    Api.transactionMonmond(p, { result in
      switch result {
      case let .success(object):
        let json = try? DictionaryEncoder().encode(object)
        self.displayResponse(json?.jsonString(prettify: true))
      case let .failure(e):
        self.displayError(e)
      }
    })
  }
  
  func uploadMonmondRequest() throws {
    guard let image = imageSelected, let imageData = image.jpegData(compressionQuality: 1) else {
      throw AppError.inputWrongOrMissing
    }
    let p = UploadMonmondApiParameter(filename: "profile")
    Api.uploadMonmond(imageData, p: p, { result in
      switch result {
      case let .success(object):
        let json = try? DictionaryEncoder().encode(object)
        self.displayResponse(json?.jsonString(prettify: true))
      case let .failure(e):
        self.displayError(e)
      }
    })
  }
  

}



