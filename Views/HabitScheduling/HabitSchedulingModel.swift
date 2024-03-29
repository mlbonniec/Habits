//
//  HabitSchedulingModel.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 13/02/2024.
//

import Foundation
import RealmSwift

enum Weekdays: String, Identifiable, PersistableEnum, InlinePickerValue {
  var id: String {
    rawValue
  }

  case sunday, monday, tuesday, wednesday, thursday, friday, saturday

  /// A short string representing each day, it's basically the first three letters.
  var short: String {
    String(self.rawValue.prefix(3)).capitalized
  }

  /// The current weekday index, absolute to allCases
  var absoluteWeekdayIndex: Int? {
    guard let weekday = Weekdays.allCases.firstIndex(where: { $0 == self }) else {
      return nil
    }

    return weekday + 1
  }

  /// A static property similar to allCases, instead that cases are ordered based on Calendar.current.firstWeekday
  static var orderedAllCases: [Weekdays] {
    let base: [Weekdays] = [.sunday, .monday, .tuesday, .wednesday, .thursday, .friday, .saturday]
    let firstWeekday: Int = Calendar.current.firstWeekday - 1

    return Array(base[firstWeekday..<base.count] + base[0..<firstWeekday])
  }

  init?(rawValue: Int) {
    if let weekday = Weekdays.allCases[safe: rawValue] {
      self = weekday
    } else {
      return nil
    }
  }
}
