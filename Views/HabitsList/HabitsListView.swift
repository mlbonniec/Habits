//
//  HabitsListView.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 10/02/2024.
//

import SwiftUI

struct HabitsListView: View {
  // MARK: Properties
  let habits: [HabitsModel]

  // MARK: Body
  var body: some View {
    List {
      ForEach(habits) { habit in
        ViewLink(destination: {
          HabitDetailsFactory.createView(habit: habit)
        }) {
          HabitsListRowView(
            systemImage: habit.systemImage,
            label: habit.label,
            description: habit.description
          )
        }
        .habitListRow()
      }
    }
    .habitList()
    .backgroundGradient()
    .navigable(String("Habits"))
  }
}

#Preview {
  HabitsListFactory.createView()
}
