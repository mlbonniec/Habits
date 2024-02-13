//
//  HabitSchedulingView.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 13/02/2024.
//

import SwiftUI

struct HabitSchedulingView: View {
  // MARK: Private Properties
  @Environment(\.dismiss) private var dismiss: DismissAction
  @State private var selectedDay: String?

  // MARK: Body
  var body: some View {
    VStack(spacing: Constants.Dimensions.medium) {
      GroupBox("Schedule habit") {
        WeekPicker(selected: $selectedDay)
      }
      .groupBoxStyle(GroupBoxHabitStyle())

      Spacer(minLength: 0)

      Group {
        if let selectedDay {
          Text("This habit will take place every \(selectedDay).")
        } else {
          Text("Select the day you want.")
        }
      }
      .font(.callout)
      .foregroundStyle(.gray)

      HabitsListRowView(
        systemImage: HabitsMapper.mock().systemImage,
        label: HabitsMapper.mock().label,
        description: HabitsMapper.mock().description
      )
      .hideChevron()

      Spacer(minLength: 0)

      Button("Schedule") {
        dismiss.callAsFunction()
        HapticHelper.success()
      }
      .buttonStyle(ButtonHabitStyle())
      .disabled(selectedDay == nil)
    }
    .padding(.vertical, Constants.Dimensions.large)
    .padding(.horizontal, Constants.Dimensions.medium)
    .presentationDetents([.medium])
    .presentationDragIndicator(.hidden)
  }
}

#Preview {
  HabitSchedulingView()
}
