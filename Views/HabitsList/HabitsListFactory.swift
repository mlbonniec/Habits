//
//  HabitsListFactory.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 10/02/2024.
//

enum HabitsListFactory {
  static func createView() -> HabitsListView {
    let habits: [HabitsModel] = HabitsMapper.map()

    return HabitsListView(habits: habits)
  }
}
