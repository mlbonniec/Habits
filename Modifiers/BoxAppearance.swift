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

  // MARK: Body
  func body(content: Content) -> some View {
    content
      .background(Constants.Colors.primary)
      .clipShape(shape)
      .shadow(color: Constants.Colors.text.opacity(0.025), radius: 15, y: 10)
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
