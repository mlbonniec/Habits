//
//  HabitsScheduleView.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 14/02/2024.
//

import SwiftUI

struct HabitsScheduleView: View {
  // MARK: Private Properties
  private let currentWeekday: Weekdays = .thursday
  
  // MARK: Reactive Properties
  @State private var selectedWeekday: Weekdays?

  // MARK: Body
  var body: some View {
    List {
      Group {
        InlinePicker(
          values: Weekdays.allCases,
          selected: $selectedWeekday,
          indicators: [currentWeekday]
        )

        ForEach(Weekdays.allCases) { day in
          if selectedWeekday == nil || day == selectedWeekday {
            GroupBox {
              Text("Nothing scheduled yet.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.caption2)
                .italic()
                .foregroundStyle(.gray)
                .padding(.leading, Constants.Dimensions.medium)
            } label: {
              Text(day.rawValue.capitalized)
                .foregroundStyle(day == currentWeekday ? Color.accentColor : .black)
            }
          }
        }
      }
      .groupBoxStyle(GroupBoxHabitStyle())
      .habitListRow()
    }
    .habitList(spacing: Constants.Dimensions.xxlarge)
    .backgroundGradient()
    .navigable("Schedule")
  }
}

#Preview {
  HabitsScheduleView()
}
