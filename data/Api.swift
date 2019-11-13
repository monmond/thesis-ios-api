//
//  Api.swift
//  rtspplayer
//
//  Created by Sasawat Sankosik on 11/11/2562 BE.
//  Copyright © 2562 Sasawat Sankosik. All rights reserved.
//

import Alamofire

struct Api {
  
  static func listMonmonds(_ onComplete: @escaping (_ result: Result<ListMonmondsApiResponse>) -> ()) {
    let url = URL.api
    let path = "/monmonds"
    let method: HTTPMethod = .get
    let parameters: Parameters? = nil
    let encoding: ParameterEncoding = URLEncoding.default
    let header: HTTPHeaders? = nil
    AF.request("\(url)\(path)",
      method: method,
      parameters: parameters,
      encoding: encoding,
      headers: header,
      onComplete)
  }
  
  static func viewMonmond(_ p: ViewMonmondApiParameter, _ onComplete: @escaping (_ result: Result<ViewMonmondApiResponse>) -> ()) {
    let url = URL.api
    let path = "/monmonds/\(p.id)"
    let method: HTTPMethod = .get
    let parameters: Parameters? = nil
    let encoding: ParameterEncoding = URLEncoding.default
    let header: HTTPHeaders? = nil
    AF.request("\(url)\(path)",
      method: method,
      parameters: parameters,
      encoding: encoding,
      headers: header,
      onComplete)
  }
  
  static func insertMonmond(_ p: InsertMonmondApiParameter, _ onComplete: @escaping (_ result: Result<InsertMonmondApiResponse>) -> ()) {
    let url = URL.api
    let path = "/monmonds/insert"
    let method: HTTPMethod = .post
    let parameters: Parameters?
    let encoding: ParameterEncoding = JSONEncoding.default
    let header: HTTPHeaders? = nil
    do {
      parameters = try DictionaryEncoder().encode(p)
      AF.request("\(url)\(path)",
        method: method,
        parameters: parameters,
        encoding: encoding,
        headers: header,
        onComplete)
    } catch let e {
      onComplete(Result<InsertMonmondApiResponse>.failure(e))
    }
  }
  
  static func updateMonmond(_ p: UpdateMonmondApiParameter, _ onComplete: @escaping (_ result: Result<UpdateMonmondApiResponse>) -> ()) {
    let url = URL.api
    let path = "/monmonds/update"
    let method: HTTPMethod = .post
    let parameters: Parameters?
    let encoding: ParameterEncoding = JSONEncoding.default
    let header: HTTPHeaders? = nil
    do {
      parameters = try DictionaryEncoder().encode(p)
      AF.request("\(url)\(path)",
        method: method,
        parameters: parameters,
        encoding: encoding,
        headers: header,
        onComplete)
    } catch let e {
      onComplete(Result<UpdateMonmondApiResponse>.failure(e))
    }
  }
  
  static func deleteMonmond(_ p: DeleteMonmondApiParameter, _ onComplete: @escaping (_ result: Result<DeleteMonmondApiResponse>) -> ()) {
    let url = URL.api
    let path = "/monmonds/delete"
    let method: HTTPMethod = .post
    let parameters: Parameters?
    let encoding: ParameterEncoding = JSONEncoding.default
    let header: HTTPHeaders? = nil
    do {
      parameters = try DictionaryEncoder().encode(p)
      AF.request("\(url)\(path)",
        method: method,
        parameters: parameters,
        encoding: encoding,
        headers: header,
        onComplete)
    } catch let e {
      onComplete(Result<DeleteMonmondApiResponse>.failure(e))
    }
  }
  
  static func transactionMonmond(_ p: TransactionMonmondApiParameter, _ onComplete: @escaping (_ result: Result<TransactionMonmondApiResponse>) -> ()) {
    let url = URL.api
    let path = "/monmonds/transaction"
    let method: HTTPMethod = .post
    let parameters: Parameters?
    let encoding: ParameterEncoding = JSONEncoding.default
    let header: HTTPHeaders? = nil
    do {
      parameters = try DictionaryEncoder().encode(p)
      AF.request("\(url)\(path)",
        method: method,
        parameters: parameters,
        encoding: encoding,
        headers: header,
        onComplete)
    } catch let e {
      onComplete(Result<TransactionMonmondApiResponse>.failure(e))
    }
  }
  
  static func uploadMonmond(_ imageData: Data, p: UploadMonmondApiParameter, _ onComplete: @escaping (_ result: Result<UploadMonmondApiResponse>) -> ()) {
    let url = URL.api
    let path = "/monmonds/upload"
    let method: HTTPMethod = .post
    let parameters: Parameters?
//    let encoding: ParameterEncoding = JSONEncoding.default
    let header: HTTPHeaders? = nil
    do {
      parameters = try DictionaryEncoder().encode(p)
      AF.upload("\(url)\(path)",
        imageData: imageData,
        method: method,
        parameters: parameters,
        headers: header,
        onComplete)
    } catch let e {
      onComplete(Result<UploadMonmondApiResponse>.failure(e))
    }
  }
  
}

