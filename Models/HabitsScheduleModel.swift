//
//  HabitsScheduleModel.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 15/02/2024.
//

import Foundation
import RealmSwift

class HabitsScheduleModel: Object, Identifiable {
  @Persisted var id: HabitsIds
  @Persisted var days: MutableSet<Weekdays>

  convenience init(id: HabitsIds, days: Set<Weekdays>) {
    self.init()
    self.id = id
    self.days = MutableSet()
    self.days.insert(objectsIn: days)
  }
}
