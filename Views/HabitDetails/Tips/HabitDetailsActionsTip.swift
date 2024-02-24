//
//  HabitDetailsActionsTip.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 24/02/2024.
//

import SwiftUI
import TipKit

@available(iOS 17.0, *)
struct HabitDetailsActionsTip: Tip {
  var id: String {
    "habitDetailsGetReminded"
  }

  var title: Text {
    Text("Get reminded")
  }

  var message: Text? {
    Text("Schedule this habit to receive notifications for specified days.")
  }

  var image: Image? {
    Image(systemName: "calendar")
  }
}
