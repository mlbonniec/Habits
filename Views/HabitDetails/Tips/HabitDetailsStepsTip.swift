//
//  HabitDetailsStepsTip.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 19/02/2024.
//

import SwiftUI
import TipKit

@available(iOS 17.0, *)
struct HabitDetailsStepsTip: Tip {
  var id: String {
    "habitDetailsCheckSteps"
  }

  var title: Text {
    Text("Check steps")
  }

  var message: Text? {
    Text("Once a step has been completed, don't forget to check it. You'll then be able to \"Mark as completed\"")
  }

  var image: Image? {
    Image(systemName: "checkmark.circle.fill")
  }
}
