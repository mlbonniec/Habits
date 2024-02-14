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
  @State private var selectedValue: Set<Weekdays> = []

  // MARK: Body
  var body: some View {
    VStack(spacing: Constants.Dimensions.medium) {
      GroupBox("Schedule habit") {
        InlinePicker(values: Weekdays.allCases, selected: $selectedValue)
      }
      .groupBoxStyle(GroupBoxHabitStyle())

      HabitsListRowView(
        systemImage: HabitsMapper.mock().systemImage,
        label: HabitsMapper.mock().id.rawValue,
        description: HabitsMapper.mock().description
      )
      .hideChevron()
      .frame(maxHeight: .infinity)

      Button("Schedule") {
        dismiss.callAsFunction()
        HapticHelper.success()
      }
      .buttonStyle(ButtonHabitStyle())
      .disabled(selectedValue.isEmpty)
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
