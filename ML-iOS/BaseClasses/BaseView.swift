//
//  BaseView.swift
//  ML-iOS
//
//  Created by Vimlesh Kumar on 21/08/22.
//

import SwiftUI

struct BaseView<Content>: View where Content: View {
  @ViewBuilder var content: () -> Content
  @Binding var loading: Bool
  
  var body: some View {
    ZStack {
      content()
        .blur(radius: loading ? 5 : 0)
      if loading {
        ZStack {
          Text("")
            .frame(width: 100, height: 100, alignment: .center)
            .background(.white)
            .cornerRadius(20)
            .shadow(radius: 4)
          ProgressView() {
            Text("Loading...")
          }
          .progressViewStyle(CircularProgressViewStyle(tint: .blue))
        }
      }
    }
  }
}
