//
//  BackgroundGradientModifier.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 11/02/2024.
//

import SwiftUI

struct BackgroundGradientModifier: ViewModifier {
  // MARK: Properties
  @State private var size: CGSize = .zero

  // MARK: Body
  func body(content: Content) -> some View {
    content
      .background(
        GeometryReader { proxy in
          Color.clear
            .onAppear { size = proxy.size }
        }
      )
      .background(
        RadialGradient(
          gradient: Gradient(colors: [
            .accentColor.opacity(0.15),
            .white
          ]),
          center: .center,
          startRadius: 0,
          endRadius: size.width
        )
      )
  }
}

extension View {
  func backgroundGradient() -> some View {
    self.modifier(BackgroundGradientModifier())
  }
}
