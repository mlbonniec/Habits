//
//  ButtonHabitStyle.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 11/02/2024.
//

import SwiftUI

/// A custom rounded button style with a gradient background.
/// Default background color is the accent color.
struct ButtonHabitStyle: ButtonStyle {
  // MARK: Private Properties
  @Environment(\.isEnabled) private var isEnabled: Bool

  // MARK: Properties
  // FIXME: Color isn't using generated assets symbols due to accentColor turning gray when disabled
  var color: Color = Color("AccentColor")

  // MARK: Body
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .foregroundStyle(.white)
      .fontWeight(.semibold)
      .fontWidth(.expanded)
      .frame(maxWidth: .infinity)
      .padding(.vertical, Constants.Dimensions.large)
      .padding(.horizontal, Constants.Dimensions.xlarge)
      .background(
        Color.white
          .overlay {
            LinearGradient(
              colors: [color.opacity(0.75), color],
              startPoint: .top,
              endPoint: .bottom
            )
          }
      )
      .modifier(BoxAppearance(cornerRadius: 20))
      .opacity(getOpacity(isPressed: configuration.isPressed))
  }

  // MARK: Private Views
  private var shape: RoundedRectangle {
    RoundedRectangle(cornerRadius: 20)
  }

  // MARK: Private Methods
  private func getOpacity(isPressed: Bool) -> CGFloat {
    guard !isPressed else {
      return 0.75
    }

    return isEnabled ? 1 : 0.5
  }
}

#Preview {
  Button("Continue") {}
    .buttonStyle(ButtonHabitStyle(color: .red))
    .padding()
}
