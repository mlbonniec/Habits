//
//  ToggleHabitStyle.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 11/02/2024.
//

import SwiftUI

/// A circle toggle style.
/// Size can be modified using the native `.controlSize(_)` modifier.
struct ToggleHabitStyle: ToggleStyle {
  // MARK: Private Properties
  @Environment(\.controlSize) private var controlSize: ControlSize

  private var size: CGFloat {
    let normalSize: CGFloat = 25

    switch controlSize {
    case .mini:
      return 15
    case .small:
      return 20
    case .regular:
      return normalSize
    case .large:
      return 30
    case .extraLarge:
      return 40
    default:
      return normalSize
    }
  }

  // MARK: Body
  func makeBody(configuration: Configuration) -> some View {
    Button(action: {
      configuration.isOn.toggle()
    }) {
      Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .foregroundStyle(configuration.isOn ? .accentColor : Color(white: 0.93))
    }
    .buttonStyle(.plain)
    .frame(width: size, height: size)
    .controlSize(.regular)
  }
}

#Preview("On Toggle") {
  Toggle(isOn: .constant(true)) {
    Text("On Toggle")
  }
  .toggleStyle(ToggleHabitStyle())
}

#Preview("Off Toggle") {
  Toggle(isOn: .constant(false)) {
    Text("Off Toggle")
  }
  .toggleStyle(ToggleHabitStyle())
}
