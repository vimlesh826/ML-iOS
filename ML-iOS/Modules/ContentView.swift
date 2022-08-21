//
//  ContentView.swift
//  ML-iOS
//
//  Created by Vimlesh Kumar on 20/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      TabView {
        SalaryPredictionView()
          .tabItem {
            Label("Salary", systemImage: "coloncurrencysign.circle")
          }
        Text("Under Development")
          .tabItem {
            Label("Salary", systemImage: "coloncurrencysign.circle")
          }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
