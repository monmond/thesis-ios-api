//
//  UITextField+Form.swift
//  rtspplayer
//
//  Created by Sasawat Sankosik on 12/11/2562 BE.
//  Copyright © 2562 Sasawat Sankosik. All rights reserved.
//

import UIKit

extension UITextField {
  
  private func setupStatic() {
    autocorrectionType = .no
    keyboardAppearance = .dark
  }
  
  //  name, namePrefix, givenName, middleName, familyName, nameSuffix, nickname
  private func setupPerson() {
    setupStatic()
    autocapitalizationType = .none
    returnKeyType = .default
    enablesReturnKeyAutomatically = true
    isSecureTextEntry = false
    //    passwordRules
    clearsOnBeginEditing = false
    clearButtonMode = .whileEditing
    clearsOnInsertion = false
  }
  
  //  jobTitle, organizationName
  private func setupJob() {
    setupStatic()
    autocapitalizationType = .none
    returnKeyType = .default
    enablesReturnKeyAutomatically = true
    isSecureTextEntry = false
    //    passwordRules
    clearsOnBeginEditing = false
    clearButtonMode = .whileEditing
    clearsOnInsertion = false
  }
  
  //  location, fullStreetAddress, streetAddressLine1, streetAddressLine2, addressCity, addressState,
  //  addressCityAndState, sublocality, countryName, postalCode
  private func setupAddress() {
    setupStatic()
    autocapitalizationType = .none
    returnKeyType = .default
    enablesReturnKeyAutomatically = true
    isSecureTextEntry = false
    //    passwordRules
    clearsOnBeginEditing = false
    clearButtonMode = .whileEditing
    clearsOnInsertion = false
  }
  
  //  telephoneNumber, emailAddress
  private func setupContact() {
    setupStatic()
    autocapitalizationType = .none
    returnKeyType = .default
    enablesReturnKeyAutomatically = true
    isSecureTextEntry = false
    //    passwordRules
    clearsOnBeginEditing = false
    clearButtonMode = .whileEditing
    clearsOnInsertion = false
  }
  
  //  URL, creditCardNumber
  private func setupFormatter() {
    setupStatic()
    autocapitalizationType = .none
    returnKeyType = .default
    enablesReturnKeyAutomatically = true
    isSecureTextEntry = false
    //    passwordRules
    clearsOnBeginEditing = false
    clearButtonMode = .whileEditing
    clearsOnInsertion = false
  }
  
  //  username, password, newPassword, oneTimeCode
  private func setupCredential() {
    setupStatic()
    autocapitalizationType = .none
    returnKeyType = .default
    enablesReturnKeyAutomatically = true
    isSecureTextEntry = false
    //    passwordRules
    clearsOnBeginEditing = true
    clearButtonMode = .always
    clearsOnInsertion = true
  }
  
  func setupDefault() {
    setupStatic()
    autocapitalizationType = .none
    returnKeyType = .default
    enablesReturnKeyAutomatically = true
    isSecureTextEntry = false
    //    passwordRules
    clearsOnBeginEditing = false
    clearButtonMode = .whileEditing
    clearsOnInsertion = false
  }
  
  //  Person
  func setupName() {
    setupPerson()
  }
  
  func setupNamePrefix() {
    setupPerson()
  }
  
  func setupGivenName() {
    setupPerson()
  }
  
  func setupMiddleName() {
    setupPerson()
  }
  
  func setupFamilyName() {
    setupPerson()
  }
  
  func setupNameSuffix() {
    setupPerson()
  }
  
  func setupNickname() {
    setupPerson()
  }
  
  //  Job
  func setupJobTitle() {
    setupJob()
  }
  
  func setupOrganizationName() {
    setupJob()
  }
  
  //  Address
  func setupLocation() {
    setupAddress()
  }
  
  func setupFullStreetAddress() {
    setupAddress()
  }
  
  func setupStreetAddressLine1() {
    setupAddress()
  }
  
  func setupStreetAddressLine2() {
    setupAddress()
  }
  
  func setupAddressCity() {
    setupAddress()
  }
  
  func setupAddressState() {
    setupAddress()
  }
  
  func setupAddressCityAndState() {
    setupAddress()
  }
  
  func setupSublocality() {
    setupAddress()
  }
  
  func setupCountryName() {
    setupAddress()
  }
  
  func setupPostalCode() {
    setupAddress()
  }
  
  //  Contact
  func setupTelephoneNumber() {
    setupContact()
    keyboardType = .numberPad
    textContentType = .telephoneNumber
  }
  
  func setupEmailAddress() {
    setupContact()
  }
  
  //  Formatter
  func setupURL() {
    setupFormatter()
  }
  
  func setupCreditCardNumber() {
    setupFormatter()
  }
  
  //  Credential
  //  https://medium.com/@abhimuralidharan/password-autofill-for-ios-apps-for-faster-login-ios-11-1d9f77deb35a
  //  https://medium.com/anilvarghese/ios-11-password-autofill-e1c763015bc1
  func setupUsername() {
    setupCredential()
    keyboardType = .default
    textContentType = .username
  }
  func setupPassword() {
    setupCredential()
    keyboardType = .asciiCapable
    textContentType = .password
    //    passwordRules = UITextInputPasswordRules(descriptor: "")
    isSecureTextEntry = true
    clearsOnBeginEditing = true
  }
  func setupNewPassword() {
    setupCredential()
  }
  func setupOneTimeCode() {
    setupCredential()
    keyboardType = .default
    textContentType = .oneTimeCode
    isSecureTextEntry = false
  }
  
}

