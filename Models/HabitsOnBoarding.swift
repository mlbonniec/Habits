//
//  HabitsOnBoarding.swift
//
//
//  Created by Mathis Le Bonniec on 24/02/2024.
//

import OnBoardingKit
import SwiftUI

struct HabitsOnBoarding: OnBoarding {
  var title: Text {
    Text("Welcome into Habits")
  }

  var description: Text? {
    Text("Complete, step by step all the requirements to do your favorite habits.")
  }

  var features: [Feature] {
    [
      Feature(
        image: Image(systemName: "calendar"),
        label: Text("Scheduling"),
        description: Text("Schedule your habits on specific days to be notified.")
      ),
      Feature(
        image: Image(systemName: "clock.arrow.circlepath"),
        label: Text("History"),
        description: Text("See all your past habits to remember what you did.")
      )
    ]
  }

  var button: Text {
    Text("Continue")
  }
}
