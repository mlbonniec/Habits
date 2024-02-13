//
//  GroupBoxHabitStyle.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 11/02/2024.
//

import SwiftUI

struct GroupBoxHabitStyle: GroupBoxStyle {
  func makeBody(configuration: Configuration) -> some View {
    VStack(alignment: .leading, spacing: Constants.Dimensions.medium) {
      configuration.label
        .padding(.leading, Constants.Dimensions.small)
        .font(.title)
        .fontWeight(.semibold)
        .fontWidth(.expanded)

      configuration.content
        .frame(maxWidth: .infinity)
    }
    .multilineTextAlignment(.leading)
  }
}

#Preview {
  GroupBox("Label") {
    Text("Content")
  }
  .groupBoxStyle(GroupBoxHabitStyle())
  .padding()
}
