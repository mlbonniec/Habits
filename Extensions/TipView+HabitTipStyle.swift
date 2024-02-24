//
//  TipView+HabitTipStyle.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 24/02/2024.
//

import SwiftUI
import TipKit

@available(iOS 17.0, *)
extension TipView {
  func habitTipStyle() -> some View {
    self
      .tipImageSize(CGSize(width: 35, height: 35))
      .tipBackground(Constants.Colors.primary)
      .shadow(color: Constants.Colors.text.opacity(0.025), radius: 15, y: 10)
  }
}
