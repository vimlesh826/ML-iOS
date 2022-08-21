//
//  SalaryPredictionViewModel.swift
//  ML-iOS
//
//  Created by Vimlesh Kumar on 20/08/22.
//

import Foundation
import Alamofire
import Combine

class SalaryPredictionViewModel: ObservableObject {
  @Published var steperCounter: Int = 1
  @Published var showAlert: Bool = false
  @Published var predictedSalary: Double = 0
  @Published var loading: Bool = false
  var alertModel: Alert = .init()
  private var cancellableSet: Set<AnyCancellable> = []
  private var apiClient: APIClient
  
  init() {
    self.apiClient = APIClient()
  }
  
  func predictSalary() {
    self.loading = true
    self.apiClient.makeRequest(
      endpoint: .salaryPrediction,
      json: try? JSONEncoder().encode(SalaryModel(experience: steperCounter)),
      returnType: Double.self
    )
    .sink { response in
      self.loading = false
      switch response {
      case .success(let response):
        self.predictedSalary = response?.data ?? 0
        self.alertModel = .init(message: "Predicted Successfully")
        self.showAlert = true
      case .failure(let message):
        self.alertModel.title = "Failure"
        self.alertModel.message = message
        self.showAlert = true
      }
    }.store(in: &cancellableSet)
  }
  
  func reset() {
    self.predictedSalary = 0
    self.steperCounter = 1
  }
}
