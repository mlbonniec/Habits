//
//  HabitsHistoryModel.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 13/02/2024.
//

import Foundation
import RealmSwift

class HabitsHistoryModel: Object, Identifiable {
  @Persisted var id: HabitsIds
  @Persisted var date: Date

  init(id: HabitsIds) {
    self.id = id
    self.date = Date.now
  }
}
