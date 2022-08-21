//
//  SalaryPredictionView.swift
//  ML-iOS
//
//  Created by Vimlesh Kumar on 20/08/22.
//

import SwiftUI

struct SalaryPredictionView: View {
  @ObservedObject private var viewModel = SalaryPredictionViewModel()
  var body: some View {
    NavigationView {
      BaseView(content: {
        VStack(spacing: 20) {
          HStack(alignment: .lastTextBaseline) {
            Text(viewModel.steperCounter.description)
              .font(.largeTitle)
              .fontWeight(.bold)
            Text("years")
          }
          Spacer()
          Stepper("Experience") {
            viewModel.steperCounter += 1
          } onDecrement: {
            if viewModel.steperCounter > 1 {
              viewModel.steperCounter -= 1
            }
          }
          Spacer()
          VStack() {
            Text("Predicted salary:")
            HStack {
              Text("₹" + viewModel.predictedSalary.description)
                .font(.largeTitle)
                .fontWeight(.bold)
            }
            Text("per month")
          }
          Spacer()
          Button {
            self.viewModel.predictSalary()
          } label: {
            Text("Predict Salary")
          }
          .buttonStyle(.borderedProminent)
          Button {
            self.viewModel.reset()
          } label: {
            Text("Reset")
          }

          Spacer()
        }
        .padding(20)
      }, loading: $viewModel.loading)
      .navigationBarHidden(true)
    }
    .alert(viewModel.alertModel.title, isPresented: $viewModel.showAlert, actions: {
      Button {
        self.viewModel.showAlert = false
      } label: {
        Text("Ok")
      }
    }, message: {Text(viewModel.alertModel.message ?? "")})
  }
}

struct SalaryPredictionView_Previews: PreviewProvider {
  static var previews: some View {
    SalaryPredictionView()
  }
}
