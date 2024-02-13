//
//  HabitDetailsFactory.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 11/02/2024.
//

enum HabitDetailsFactory {
  static func createView(habit: HabitsModel) -> HabitDetailsView {
    HabitDetailsView(habit: habit)
  }
}
