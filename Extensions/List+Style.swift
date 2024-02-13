//
//  List+Style.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 12/02/2024.
//

import SwiftUI

extension View {
  /// Set the habit list items with some default modifiers.
  /// - Separator's is hidden
  /// - Insets has been modified
  /// - Background color is clear
  /// - Horizontal adding
  func habitListRow() -> some View {
    self
      .listRowSeparator(.hidden)
      .listRowInsets(
        EdgeInsets(
          top: 0,
          leading: Constants.Dimensions.medium,
          bottom: 0,
          trailing: Constants.Dimensions.medium
        )
      )
      .listRowBackground(Color.clear)
  }
}

extension List {
  /// Set the habit list with some default modifiers.
  /// - List style is now plain
  /// - Rows spacing has been modified
  func habitList() -> some View {
    self
      .listStyle(.plain)
      .listRowSpacing(Constants.Dimensions.medium)
  }
}
