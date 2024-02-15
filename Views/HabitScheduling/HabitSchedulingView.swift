//
//  HabitSchedulingView.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 13/02/2024.
//

import RealmSwift
import SwiftUI

struct HabitSchedulingView: View {
  // MARK: Properties
  let habit: HabitsModel

  // MARK: Private Properties
  @Environment(\.dismiss) private var dismiss: DismissAction
  @Environment(\.realm) private var realm: Realm
  @State private var selectedValues: Set<Weekdays> = []

  // MARK: Body
  var body: some View {
    VStack(spacing: Constants.Dimensions.medium) {
      GroupBox("Schedule habit") {
        InlinePicker(values: Weekdays.allCases, selected: $selectedValues)
      }
      .groupBoxStyle(GroupBoxHabitStyle())

      HabitsListRowView(
        systemImage: habit.systemImage,
        label: habit.id.rawValue,
        description: habit.description
      )
      .hideChevron()
      .frame(maxHeight: .infinity)

      Button("Schedule") {
        try? realm.write {
          let schedule: HabitsScheduleModel = HabitsScheduleModel(
            id: habit.id,
            days: selectedValues
          )

          realm.add(schedule)
        }
        
        // dismiss.callAsFunction()
        HapticHelper.success()
      }
      .buttonStyle(ButtonHabitStyle())
      .disabled(selectedValues.isEmpty)
    }
    .padding(.vertical, Constants.Dimensions.large)
    .padding(.horizontal, Constants.Dimensions.medium)
    .presentationDetents([.medium])
    .presentationDragIndicator(.hidden)
  }
}

#Preview {
  let habit: HabitsModel = HabitsMapper.mock()
  
  return HabitSchedulingFactory.createView(habit: habit)
}
