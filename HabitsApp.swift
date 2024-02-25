//
//  HabitsApp.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 10/02/2024.
//

import OnBoardingKit
import SwiftUI
import TipKit

@main
struct HabitsApp: App {
  // MARK: Body
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(HabitsNotificationsDelegate())
    }
  }
}

struct ContentView: View {
  // MARK: Private Properties
  @State private var activeTab: AppTabView = .habits
  @EnvironmentObject private var notificationDelegate: HabitsNotificationsDelegate

  // MARK: Body
  var body: some View {
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
    .task {
      if #available(iOS 17.0, *) {
        // MARK: Demo purpose only
        try? Tips.resetDatastore()

        try? Tips.configure([
          .displayFrequency(.immediate),
          .datastoreLocation(.applicationDefault)
        ])
      }
    }
    .onAppear {
      NotificationsHelper.resetBadgeCount()

      // MARK: Demo purpose only
      OnBoardingKit.resetDatastore()
    }
    .sheet(item: $notificationDelegate.shownDetails) { id in
      if let habit = HabitsMapper.mapById(id: id) {
        HabitDetailsFactory.createView(habit: habit)
          .navigable()
      }
    }
    .presentOnBoarding(HabitsOnBoarding(), mode: .sheet)
  }
}
