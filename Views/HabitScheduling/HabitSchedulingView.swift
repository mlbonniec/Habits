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
  @State private var selectedValue: Weekdays?

  // MARK: Body
  var body: some View {
    VStack(spacing: Constants.Dimensions.medium) {
      GroupBox("Schedule habit") {
        InlinePicker(values: Weekdays.allCases, selected: $selectedValue)
      }
      .groupBoxStyle(GroupBoxHabitStyle())

      Spacer(minLength: 0)

      Group {
        if let selectedValue {
          Text("This habit will take place every ")
          +
          Text(selectedValue.rawValue)
            .foregroundColor(Color.accentColor)
            .fontWeight(.semibold)
          +
          Text(".")
        } else {
          Text("When will the habit be scheduled ?")
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
      .disabled(selectedValue == nil)
    }
    .padding(.vertical, Constants.Dimensions.large)
    .padding(.horizontal, Constants.Dimensions.medium)
    .presentationDetents([.medium])
    .presentationDragIndicator(.hidden)
  }
}

#Preview {
  HabitSchedulingFactory.createView()
}
