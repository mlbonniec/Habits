//
//  BackgroundGradientModifier.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 11/02/2024.
//

import SwiftUI

struct BackgroundGradientModifier: ViewModifier {
  // MARK: Private Properties
  @Environment(\.colorScheme) private var colorScheme: ColorScheme

  // MARK: Body
  func body(content: Content) -> some View {
    GeometryReader { proxy in
      content
        .background(
          RadialGradient(
            gradient: Gradient(colors: [
              Constants.Colors.Gradient.start,
              Constants.Colors.Gradient.end
            ]),
            center: .center,
            startRadius: 0,
            endRadius: proxy.size.width
          )
        )
    }
  }
}

extension View {
  func backgroundGradient() -> some View {
    self.modifier(BackgroundGradientModifier())
  }
}
