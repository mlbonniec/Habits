//
//  HabitsHistoryView.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 12/02/2024.
//

import SwiftUI

struct HabitsHistoryView: View {
  // MARK: Properties
  // TODO: Replace with real data
  private let data: [HabitsModel] = HabitsMapper.map()

  // MARK: Body
  var body: some View {
    Group {
      if data.isEmpty {
        HabitsHistoryNoDataView()
      } else {
        HistoryList
      }
    }
    .navigable("History")
  }

  // MARK: Private Views
  private var HistoryList: some View {
    List(data) { habit in
      HabitsListRowView(
        systemImage: habit.systemImage,
        label: habit.id.rawValue,
        description: Date().formatted()
      )
      .hideChevron()
      .habitListRow()
    }
    .habitList()
    .backgroundGradient()
  }
}

#Preview {
  HabitsHistoryView()
}
