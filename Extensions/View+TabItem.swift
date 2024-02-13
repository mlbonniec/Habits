//
//  View+TabItem.swift
//   Habits
//
//  Created by Mathis Le Bonniec on 12/02/2024.
//

import SwiftUI

enum AppTabView {
  case habits, calendar, history
}

extension View {
  func tabItem(
    label: LocalizedStringKey,
    systemImage: String,
    activeSystemImage: String? = nil,
    tag: AppTabView,
    activeTab: AppTabView
  ) -> some View {
    self
      .tag(tag)
      .tabItem {
        Label(label, systemImage: tag == activeTab ? activeSystemImage ?? systemImage : systemImage)
          .environment(\.symbolVariants, .none)
      }
  }
}
