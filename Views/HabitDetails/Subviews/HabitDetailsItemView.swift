//
//  HabitDetailsItemView.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 11/02/2024.
//

import SwiftUI

struct HabitDetailsItemView: View {
  // MARK: Properties
  let label: String
  var description: String?

  // MARK: Reactive Properties
  @Binding var isOn: Bool

  // MARK: Private Properties
  private let animation: Animation = .snappy(duration: 0.25)

  // MARK: Body
  var body: some View {
    BoxShape {
      Toggle("Done", isOn: $isOn.animation(animation))
        .toggleStyle(ToggleHabitStyle())

      VStack(alignment: .leading, spacing: Constants.Dimensions.tiny) {
        Text(label)
          .fontWeight(.semibold)
          .opacity(isOn ? 0.5 : 1)
          .strikethrough(isOn, pattern: .solid)

        if let description {
          Text(description)
            .font(.callout)
            .fontWeight(.light)
            .foregroundStyle(.gray)
            .opacity(isOn ? 0.5 : 1)
            .strikethrough(isOn, pattern: .solid)
        }
      }

      Spacer(minLength: 0)
    }
    .onTapGesture {
      withAnimation(animation) {
        isOn.toggle()
      }
    }
    .onChange(of: isOn) { _ in
      HapticHelper.impactOccurred()
    }
    .onAppear {
      HapticHelper.impact.prepare()
    }
  }
}

#Preview("On without description") {
  HabitDetailsItemView(
    label: "Habit",
    description: "Short habit description",
    isOn: .constant(true)
  )
  .padding()
}

#Preview("Off with description") {
  HabitDetailsItemView(
    label: "Habit",
    description: "Short habit description",
    isOn: .constant(false)
  )
  .padding()
}
