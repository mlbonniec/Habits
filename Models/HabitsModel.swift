//
//  HabitsModel.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 12/02/2024.
//

import SwiftUI

struct HabitsModel: Identifiable {
  /// The habit id
  let id: HabitsIds

  /// An system icon from the SF Symbols
  let systemImage: String

  /// The habit main name
  let label: String

  /// An optional description
  var description: String?

  /// The list of steps for the current habit
  let steps: [Step]

  struct Step: Identifiable {
    /// The step id
    let id: HabitsIds.Steps

    /// The step main name
    let label: String

    /// An optional step description
    var description: String?
  }
}
