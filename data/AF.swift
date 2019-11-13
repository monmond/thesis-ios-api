//
//  AF.swift
//  rtspplayer
//
//  Created by Sasawat Sankosik on 11/11/2562 BE.
//  Copyright © 2562 Sasawat Sankosik. All rights reserved.
//

import Alamofire

class AF {
  
  static let session = SessionManager.debug
  
  static func request<T: Codable>(_ endpoint: URLRequestConvertible, _ onComplete: @escaping (_ result: Result<T>) -> ()) {
    session.request(endpoint).validate().responseData(completionHandler: { response in
      onComplete(responseSerializer(response))
    })
  }
  
  static func request<T: Codable>(_ url: String,
                                  method: HTTPMethod,
                                  parameters: Parameters? = nil,
                                  encoding: ParameterEncoding = URLEncoding.default,
                                  headers: HTTPHeaders? = nil,
                                  _ onComplete: @escaping (_ result: Result<T>) -> ()) {
    session.request(url,
                    method: method,
                    parameters: parameters,
                    encoding: encoding,
                    headers: headers).validate().responseData(completionHandler: { response in
      onComplete(responseSerializer(response))
    })
  }
  
  static func upload<T: Codable>(_ url: String,
                                 imageData: Data,
                                 method: HTTPMethod,
                                 parameters: Parameters? = nil,
                                 headers: HTTPHeaders? = nil,
                                 _ onComplete: @escaping (_ result: Result<T>) -> ()) {
    let filename = parameters!["filename"] as! String
    session.upload(multipartFormData: { multipartFormData in
      multipartFormData.append(imageData, withName: filename, fileName: "\(filename).jpeg", mimeType: "image/jpeg")
    }, to: url,
       method: method,
       headers: headers,
       encodingCompletion: { result in
      switch result {
      case let .success(request, _, _):
        request.responseData { response in
          onComplete(responseSerializer(response))
        }
      case let .failure(e):
        onComplete(Result<T>.failure(e))
      }
    })
  }
  
  private static func responseSerializer<T: Codable>(_ response: DataResponse<Data>) -> Result<T> {
    var result: Result<T>
    switch response.result {
    case let .success(d):
      result = Result<T>(value: {
        try JSONDecoder().decode(T.self, from: d)
      })
    case let .failure(e):
      result = Result<T>.failure(e)
    }
    return result
  }
  
}
