//
//  HabitsScheduleView.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 14/02/2024.
//

import RealmSwift
import SwiftUI
import TipKit

struct HabitsScheduleView: View {
  // MARK: Reactive Properties
  @ObservedResults(HabitsScheduleModel.self) private var schedule: Results<HabitsScheduleModel>
  @State private var selectedWeekday: Weekdays?
  @State private var selectedHabit: HabitsModel?

  // MARK: Private Methods
  var selectedDays: [Weekdays] {
    if let selectedWeekday {
      return [selectedWeekday]
    }

    return Weekdays.orderedAllCases
  }

  // MARK: Body
  var body: some View {
    List {
      Group {
        InlinePicker(
          values: Weekdays.orderedAllCases,
          selected: $selectedWeekday,
          indicators: Set([
            Calendar.currentWeekday
          ].compactMap { $0 })
        )

        if #available(iOS 17.0, *) {
          TipView(HabitsSchedulePickerTip(), arrowEdge: .top)
            .habitTipStyle()
        }

        ForEach(selectedDays) { day in
          GroupBox {
            let filteredIds: [HabitsIds] = schedule.filter { $0.days.contains(day) }.map { $0.id }
            if filteredIds.isEmpty {
              Text("Nothing scheduled yet.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.caption2)
                .italic()
                .foregroundStyle(.gray)
                .padding(.leading, Constants.Dimensions.medium)
            } else {
              ForEach(filteredIds) { id in
                if let habit: HabitsModel = HabitsMapper.mapById(id: id) {
                  Button(action: { selectedHabit = habit }) {
                    HabitsListRowView(
                      systemImage: habit.systemImage,
                      label: habit.id.rawValue,
                      description: habit.description
                    )
                  }
                }
              }
            }
          } label: {
            Text(day.rawValue.capitalized)
              .foregroundStyle(day == Calendar.currentWeekday ? Color.accentColor : Constants.Colors.text)
          }
          .groupBoxStyle(GroupBoxHabitStyle())
          .padding(.bottom, day == selectedDays.last ? Constants.Dimensions.xxlarge : 0)
        }
      }
      .habitListRow()
    }
    .habitList(spacing: Constants.Dimensions.xxlarge)
    .backgroundGradient()
    .navigable("Schedule")
    .sheet(item: $selectedHabit) { habit in
      HabitDetailsFactory.createView(habit: habit)
        .navigable()
    }
  }
}

#Preview {
  HabitsScheduleView()
}
