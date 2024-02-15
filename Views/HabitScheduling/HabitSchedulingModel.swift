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

  init?(rawValue: Int?) {
    switch rawValue {
    case 1:
      self = .monday
    case 2:
      self = .tuesday
    case 3:
      self = .wednesday
    case 4:
      self = .thursday
    case 5:
      self = .friday
    case 6:
      self = .saturday
    case 7:
      self = .sunday
    default:
      return nil
    }
  }
}
