//
//  APIClient.swift
//  ML-iOS
//
//  Created by Vimlesh Kumar on 21/08/22.
//

import Foundation
import Alamofire
import Combine

class APIClient {
  
  func makeRequest<T: Codable>(endpoint: Endpoints, json: Data? = nil, returnType: T.Type)-> AnyPublisher<Response<T>, Never> {
    
    let config = EndpointConfigurator(endpoint: endpoint)
    
    var request = try! URLRequest(url: config.url, method: config.method)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    if let json = json {
      request.httpBody = json
    }
    
    return AF.request(request)
    .validate(statusCode: 200...600)
    .publishDecodable(type: CommonResponseModel<T>.self)
    .map { respose in
      print(respose)
      if respose.error != nil {
        return .failure(respose.error?.errorDescription)
      } else {
        if respose.value?.status == 200 {
          return .success(respose.value)
        } else {
          return .failure(respose.value?.message)
        }
      }
    }
    .receive(on: DispatchQueue.main)
    .eraseToAnyPublisher()
  }
}
