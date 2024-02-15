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
  
  init(habit: HabitsModel) {
    let realm: Realm? = try? Realm()
    
    self.habit = habit
    
    if let loadedScheduledDays = realm?.objects(HabitsScheduleModel.self).first(where: { $0.id == habit.id })?.days {
      self._selectedValues = State(initialValue: Set(loadedScheduledDays))
    } else {
      self._selectedValues = State(initialValue: [])
    }
  }

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

          realm.objects(HabitsScheduleModel.self).filter { $0.id == habit.id }.forEach { object in
            realm.delete(object)
          }

          realm.add(schedule)
        }
        
        dismiss.callAsFunction()
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
