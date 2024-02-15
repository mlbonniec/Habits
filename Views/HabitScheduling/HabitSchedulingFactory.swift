//
//  HabitSchedulingFactory.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 13/02/2024.
//

enum HabitSchedulingFactory {
  static func createView(habit: HabitsModel) -> HabitSchedulingView {
    HabitSchedulingView(habit: habit)
  }
}
