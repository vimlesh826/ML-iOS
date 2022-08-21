//
//  EndpointConfigurator.swift
//  ML-iOS
//
//  Created by Vimlesh Kumar on 21/08/22.
//

import Foundation
import Alamofire

struct EndpointConfigurator {
  private let baseURL = "http://13.232.102.140:8080/"
  private var path = ""
  var url: URL {
    return URL(string:  baseURL + path)!
  }
  var method = HTTPMethod.get
  
  var endpoint: Endpoints
  
  init(endpoint: Endpoints) {
    self.endpoint = endpoint
    switch endpoint {
    case .salaryPrediction:
      self.method = .post
      self.path = "models/predict-salary"
    }
  }
}
