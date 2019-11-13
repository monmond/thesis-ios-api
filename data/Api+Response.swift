//
//  UsersApiResponse.swift
//  thesis-ios-api
//
//  Created by Sasawat Sankosik on 11/11/2562 BE.
//  Copyright © 2562 ssankosik. All rights reserved.
//

import Foundation

struct ListMonmondsApiResponse: Codable {
  var data: [Monmond]?
  var statusCode: Int
}

struct ViewMonmondApiResponse: Codable {
  var data: Monmond?
  var statusCode: Int
}

struct InsertMonmondApiResponse: Codable {
  var data: Bool?
  var statusCode: Int
}

struct UpdateMonmondApiResponse: Codable {
  var data: Bool?
  var statusCode: Int
}

struct DeleteMonmondApiResponse: Codable {
  var data: Bool?
  var statusCode: Int
}

struct TransactionMonmondApiResponse: Codable {
  var data: Bool?
  var statusCode: Int
}

struct UploadMonmondApiResponse: Codable {
  var data: String?
  var statusCode: Int
}

