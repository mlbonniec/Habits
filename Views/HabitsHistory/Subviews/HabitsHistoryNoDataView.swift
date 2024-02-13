//
//  HabitsHistoryNoDataView.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 12/02/2024.
//

import SwiftUI

struct HabitsHistoryNoDataView: View {
  // MARK: Body
  var body: some View {
    if #available(iOS 17.0, *) {
      ContentUnavailableView(
        "No History",
        systemImage: "clock.arrow.circlepath",
        description: text
      )
    } else {
      text
        .font(.subheadline)
        .foregroundStyle(.gray)
    }
  }

  // MARK: Private Views
  private var text: Text {
    Text("No habits has been marked as completed yet.")
  }
}

#Preview {
  HabitsHistoryNoDataView()
}
