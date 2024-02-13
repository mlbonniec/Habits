//
//  HabitSchedulingModel.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 13/02/2024.
//

enum Weekdays: String, InlinePickerValue {
  case monday, tuesday, wednesday, thursday, friday, saturday, sunday

  var short: String {
    String(self.rawValue.prefix(3)).capitalized
  }
}
