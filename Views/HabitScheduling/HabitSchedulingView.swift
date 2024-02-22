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

  // MARK: Reactive Properties
  @Environment(\.dismiss) private var dismiss: DismissAction
  @Environment(\.realm) private var realm: Realm
  @State private var selectedValues: Set<Weekdays>
  
  // MARK: Private Properties
  private var initialSelectedValues: Set<Weekdays>

  // MARK: Computed Properties
  private var isSelectionDifferentThanInitial: Bool {
    selectedValues != initialSelectedValues
  }

  private var scheduleLabel: String {
    switch (initialSelectedValues.isEmpty, selectedValues.isEmpty) {
    case (false, true):
      return "Remove schedule"
    case (true, _):
      return "Add schedule"
    default:
      return "Update schedule"
    }
  }

  // MARK: Lifecycle
  init(habit: HabitsModel) {
    self.habit = habit

    if let realm: Realm = try? Realm(),
       let loadedScheduledDays = realm.objects(HabitsScheduleModel.self).first(where: { $0.id == habit.id })?.days {
      self.initialSelectedValues = Set(loadedScheduledDays)
      self._selectedValues = State(initialValue: self.initialSelectedValues)
    } else {
      self.initialSelectedValues = []
      self._selectedValues = State(initialValue: self.initialSelectedValues)
    }
  }

  // MARK: Body
  var body: some View {
    VStack(spacing: Constants.Dimensions.medium) {
      GroupBox("Schedule habit") {
        InlinePicker(
          values: Weekdays.orderedAllCases,
          selected: $selectedValues,
          indicators: Set([
            Calendar.currentWeekday
          ].compactMap { $0 })
        )
      }
      .groupBoxStyle(GroupBoxHabitStyle())

      HabitsListRowView(
        systemImage: habit.systemImage,
        label: habit.id.rawValue,
        description: habit.description
      )
      .hideChevron()
      .frame(maxHeight: .infinity)

      Button(scheduleLabel) {
        try? realm.write {
          let schedule: HabitsScheduleModel = HabitsScheduleModel(
            id: habit.id,
            days: selectedValues
          )

          realm.objects(HabitsScheduleModel.self).filter { $0.id == habit.id }.forEach { object in
            realm.delete(object)
          }

          realm.add(schedule)
        }

        Weekdays.allCases.forEach { weekday in
          NotificationsHelper.removeHabitNotification(for: weekday, habitId: habit.id)
        }

        selectedValues.forEach { selectedDay in
          NotificationsHelper.setupHabitNotification(for: selectedDay, habitId: habit.id)
        }

        dismiss.callAsFunction()
        HapticHelper.success()
      }
      .buttonStyle(ButtonHabitStyle())
      .disabled(!isSelectionDifferentThanInitial)
    }
    .padding(.vertical, Constants.Dimensions.large)
    .padding(.horizontal, Constants.Dimensions.medium)
    .presentationDetents([.medium])
    .presentationDragIndicator(.hidden)
    .backgroundGradient()
  }
}

#Preview {
  let habit: HabitsModel = HabitsMapper.mock()
  
  return HabitSchedulingFactory.createView(habit: habit)
}
