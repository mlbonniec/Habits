//
//  BoxAppearance.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 18/02/2024.
//

import SwiftUI

struct BoxAppearance: ViewModifier {
  // MARK: Properties
  let cornerRadius: CGFloat

  // MARK: Reactive Properties
  @Environment(\.colorScheme) private var colorScheme: ColorScheme

  // MARK: Computed Properties
  private var shadowOpacity: CGFloat {
    colorScheme == .dark ? 0.025 : 0.05
  }

  // MARK: Body
  func body(content: Content) -> some View {
    content
      .background(Constants.Colors.primary)
      .clipShape(shape)
      .shadow(color: Color.primary.opacity(shadowOpacity), radius: 15, y: 10)
      .overlay {
        shape
          .stroke(Constants.Colors.stroke, lineWidth: 1)
      }
  }

  // MARK: Private Views
  private var shape: RoundedRectangle {
    RoundedRectangle(cornerRadius: cornerRadius)
  }
}
