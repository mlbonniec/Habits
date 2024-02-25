//
//  HabitsOnBoarding.swift
//
//
//  Created by Mathis Le Bonniec on 24/02/2024.
//

import OnBoardingKit
import SwiftUI

struct HabitsOnBoarding: OnBoarding {
  var image: ImageStyle? {
    return .icon(Constants.Images.onBoardingAppIcon)
  }

  var title: Text {
    Text("Welcome into Habits")
  }

  var description: Text? {
    Text("Prevent memory loss by taking daily habits one step at a time.")
  }

  var features: [Feature] {
    [
      Feature(
        image: Image(systemName: "brain.fill"),
        label: Text("Remember"),
        description: Text("Remember the different steps of each daily habit.")
      ),
      Feature(
        image: Image(systemName: "calendar"),
        label: Text("Schedule"),
        description: Text("Schedule your habits on specific days to be notified.")
      ),
      Feature(
        image: Image(systemName: "clock.arrow.circlepath"),
        label: Text("History"),
        description: Text("See all your past habits to remember what you did.")
      )
    ]
  }

  var notice: Notice? {
    Notice(
      text: Text("This playground has been made for the 2024 Swift Student Challenge."),
      link: OnBoardingKit.Notice.Link(
        title: Text("Learn more."),
        url: URL(string: "https://developer.apple.com/swift-student-challenge")
      )
    )
  }

  var button: Text {
    Text("Continue")
  }
}
