//
//  HabitSchedulingModel.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 13/02/2024.
//

import RealmSwift

enum Weekdays: String, Identifiable, PersistableEnum, InlinePickerValue {
  var id: String {
    rawValue
  }

  case monday, tuesday, wednesday, thursday, friday, saturday, sunday

  var short: String {
    String(self.rawValue.prefix(3)).capitalized
  }
}
