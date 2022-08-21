//
//  SalaryPredictionModel.swift
//  ML-iOS
//
//  Created by Vimlesh Kumar on 20/08/22.
//

import Foundation

struct Alert {
  var message: String?
  var title: String = "Success"
}

struct SalaryModel: Codable {
  var experience: Int
}
