//
//  WeekPicker.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 12/02/2024.
//

import SwiftUI

struct WeekPicker: View {
  // MARK: Properties
  @Binding var selected: String?

  // MARK: Private Properties
  private let days: [String] = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ]

  // MARK: Body
  var body: some View {
    VStack(spacing: Constants.Dimensions.medium) {
      LazyVGrid(
        columns: Array(repeating: GridItem(.flexible()), count: days.count),
        spacing: Constants.Dimensions.small
      ) {
        ForEach(days, id: \.self) { day in
          Button(action: {
            withAnimation {
              selected = selected == day ? nil : day
            }
            HapticHelper.selectionChanged()
          }) {
            getDayColor(isActive: selected == day)
              .aspectRatio(1, contentMode: .fit)
              .overlay {
                Text(day)
                  .font(.caption)
                  .fontWeight(.semibold)
                  .foregroundStyle(selected == day ? .white : .black)
              }
              .clipShape(RoundedRectangle(cornerRadius: 15))
              .shadow(color: .black.opacity(0.05), radius: 15, y: 10)
              .overlay {
                RoundedRectangle(cornerRadius: 15)
                  .stroke(Color(red: 229 / 255, green: 235 / 255, blue: 237 / 255), lineWidth: 1)
                  .aspectRatio(1, contentMode: .fill)
              }
          }
          .buttonStyle(.plain)
        }
      }
    }
    .onAppear {
      HapticHelper.selection.prepare()
    }
  }

  // MARK: Private Method
  func getDayColor(isActive: Bool) -> some View {
    if !isActive {
      return AnyView(Color.white)
    }

    return AnyView(
      LinearGradient(
        colors: [.accentColor.opacity(0.75), .accentColor],
        startPoint: .top,
        endPoint: .bottom
      )
    )
  }
}

#Preview {
  WeekPicker(selected: .constant(nil))
}
