//
//  HabitsApp.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 10/02/2024.
//

import SwiftUI

@main
struct HabitsApp: App {
  // MARK: Private Properties
  @State private var activeTab: AppTabView = .habits

  // MARK: Body
  var body: some Scene {
    WindowGroup {
      TabView(selection: $activeTab) {
        HabitsListFactory.createView()
          .tabItem(
            label: "Habits",
            systemImage: "checklist",
            activeSystemImage: "checklist.checked",
            tag: .habits,
            activeTab: activeTab
          )

        HabitsScheduleFactory.createView()
          .tabItem(
            label: "Schedule",
            systemImage: "calendar",
            tag: .calendar,
            activeTab: activeTab
          )

        HabitsHistoryFactory.createView()
          .tabItem(
            label: "History",
            systemImage: "clock.arrow.circlepath",
            tag: .history,
            activeTab: activeTab
          )
      }
    }
  }
}
