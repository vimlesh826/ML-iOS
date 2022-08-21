//
//  APIModels.swift
//  ML-iOS
//
//  Created by Vimlesh Kumar on 21/08/22.
//

import Foundation

struct CommonResponseModel<T:Codable>: Codable {
  let data: T?
  let success: Bool
  let status: Int
  let message: String
}

enum Response<T:Codable> {
  case success(CommonResponseModel<T>?)
  case failure(String?)
}
