//
//  HabitsScheduleModel.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 15/02/2024.
//

import Foundation
import RealmSwift

class HabitsScheduleModel: Object {
  @Persisted var id: HabitsIds
  @Persisted var days: List<Weekdays>

  convenience init(id: HabitsIds, days: [Weekdays]) {
    self.init()
    self.id = id
    self.days = List()
    self.days.append(objectsIn: days)
  }
}
