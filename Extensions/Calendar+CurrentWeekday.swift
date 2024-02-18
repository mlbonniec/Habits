//
//  Calendar+CurrentWeekday.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 18/02/2024.
//

import Foundation

extension Calendar {
  static var currentWeekday: Weekdays? {
    let date = Calendar.current.dateComponents([.weekday], from: Date.now)
    let weekday = date.weekday

    if let weekday {
      return Weekdays(rawValue: weekday - 1)
    }
    return nil
  }
}
