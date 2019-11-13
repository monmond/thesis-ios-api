//
//  Api+Endpoint.swift
//  rtspplayer
//
//  Created by Sasawat Sankosik on 12/11/2562 BE.
//  Copyright © 2562 Sasawat Sankosik. All rights reserved.
//

import Alamofire

extension Api {
  
  enum Routes: URLRequestConvertible {
    case listMonmonds(ListMonmonds.Parameter)
    var host: String {
      return URL.api
    }
    var path: String {
      var group = ""
      var route = ""
      switch self {
      case .listMonmonds:
        group = "/monmonds"
        route = ""
      }
      return "\(group)\(route)"
    }
    var method: HTTPMethod {
      var method: HTTPMethod = .get
      switch self {
      case .listMonmonds:
        method = .get
      }
      return method
    }
    var header: HTTPHeaders? {
      var header: HTTPHeaders?
      switch self {
      case .listMonmonds:
        header = nil
      }
      return header
    }
    func encode(_ request: URLRequest) throws -> URLRequest {
      var request = request
      switch self {
      case let .listMonmonds(p):
        let parameters = try DictionaryEncoder().encode(p)
        request = try JSONEncoding.default.encode(request, with: parameters)
      }
      return request
    }
    func asURLRequest() throws -> URLRequest {
      let url = try host.asURL()
      let request = try URLRequest(url: url.appendingPathComponent(path), method: method, headers: header)
      return try encode(request)
    }
  }
  
  struct ListMonmonds {
    struct Data: Codable {
      
    }
    struct Response: Codable {
      var data: [Monmond]?
      var statusCode: Int?
    }
    struct Parameter: Encodable {
      
    }
    static func request(_ parameters: Parameter, _ onComplete: @escaping (_ result: Result<Response>) -> ()) {
      let endpoint = Routes.listMonmonds(parameters)
      AF.request(endpoint, onComplete)
    }
  }
  
}

