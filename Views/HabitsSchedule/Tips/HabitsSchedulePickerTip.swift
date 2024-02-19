//
//  HabitsSchedulePickerTip.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 19/02/2024.
//

import SwiftUI
import TipKit

@available(iOS 17.0, *)
struct HabitsSchedulePickerTip: Tip {
  var id: String {
    "filterDaysPickerTip"
  }

  var title: Text {
    Text("Filter days")
  }

  var message: Text? {
    Text("Click on a day to only display habits for the selected one.")
  }

  var image: Image? {
    Image(systemName: "line.3.horizontal.decrease.circle.fill")
  }
}
