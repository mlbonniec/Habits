//
//  CloseButton.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 11/02/2024.
//

import SwiftUI

/// A simple close button that match Apple one's.
/// Inspired by https://github.com/joogps/ExitButton
struct CloseButton: View {
  // MARK: Properties
  let action: () -> Void

  // MARK: Private Properties
  @Environment(\.colorScheme) private var colorScheme

  private enum Constants {
    static let size: CGFloat = 24
    static let scaleEffect: CGFloat = 0.416
  }

  // MARK: Body
  var body: some View {
    Button(action: action) {
      ZStack {
        Circle()
          .fill(Color(white: colorScheme == .dark ? 0.19 : 0.93))

        Image(systemName: "xmark")
          .resizable()
          .scaledToFit()
          .font(.body.bold())
          .scaleEffect(Constants.scaleEffect)
          .foregroundColor(Color(white: colorScheme == .dark ? 0.62 : 0.51))
      }
      .frame(width: Constants.size, height: Constants.size)
    }
  }
}

#Preview("Light scheme") {
  CloseButton {}
    .preferredColorScheme(.light)
}

#Preview("Dark scheme") {
  CloseButton {}
    .preferredColorScheme(.dark)
}
