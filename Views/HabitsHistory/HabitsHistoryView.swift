//
//  HabitsHistoryView.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 12/02/2024.
//

import RealmSwift
import SwiftUI

struct HabitsHistoryView: View {
  // MARK: Reactive Properties
  @ObservedResults(HabitsHistoryModel.self) private var history: Results<HabitsHistoryModel>

  // MARK: Body
  var body: some View {
    Group {
      if history.isEmpty {
        HabitsHistoryNoDataView()
      } else {
        HistoryList
      }
    }
    .navigable("History")
  }

  // MARK: Private Views
  private var HistoryList: some View {
    List(history.sorted(by: \.date, ascending: false)) { habit in
      if let item = HabitsMapper.mapById(id: habit.id) {
        HabitsListRowView(
          systemImage: item.systemImage,
          label: habit.id.rawValue,
          description: habit.date.formatted()
        )
        .hideChevron()
        .habitListRow()
      }
    }
    .habitList()
    .backgroundGradient()
  }
}

#Preview {
  HabitsHistoryView()
}
