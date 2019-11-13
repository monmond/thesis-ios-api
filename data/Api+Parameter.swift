//
//  Api+Parameter.swift
//  thesis-ios-api
//
//  Created by Sasawat Sankosik on 12/11/2562 BE.
//  Copyright © 2562 ssankosik. All rights reserved.
//

import Foundation

struct ListMonmondsApiParameter: Codable {
  
}

struct ViewMonmondApiParameter: Codable {
  var id: Int
}

struct InsertMonmondApiParameter: Codable {
  var name: String
  var age: Int
}

struct UpdateMonmondApiParameter: Codable {
  var name: String
  var age: Int
}

struct DeleteMonmondApiParameter: Codable {
  var name: String
  var age: Int
}

struct TransactionMonmondApiParameter: Codable {
  var name: String
  var age: Int
}

struct UploadMonmondApiParameter: Codable {
  var filename: String
}
