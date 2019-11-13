//
//  Api+Extension.swift
//  rtspplayer
//
//  Created by Sasawat Sankosik on 11/11/2562 BE.
//  Copyright © 2562 Sasawat Sankosik. All rights reserved.
//

import Alamofire
import Sniffer

extension SessionManager {
  
  static var debug: SessionManager {
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
    Sniffer.enable(in: configuration)
    return SessionManager(configuration: configuration)
  }
  
}

extension URL {
  
  static var api = "http://localhost:8090"
  
}
