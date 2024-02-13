//
//  View+Navigable.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 10/02/2024.
//

import SwiftUI

extension View {
  /// The `.navigable` modifier is intended to add a NavigationStack at the
  /// root of the view. As it's embedding all the content, all your others modifiers
  /// must be added **before** `.navigable`.
  ///
  /// - parameters
  ///   - title: The navigation title
  ///   - displayMode: The navigation title display mode (`inline`, `large`, `automatic`)
  ///
  /// ```swift
  /// Text("Hello, World")
  ///   .navigable("Navigation Title")
  ///
  /// Text("Hello, World")
  ///   .navigable("Navigation Title", .large)
  /// ```
  func navigable(
    _ title: LocalizedStringKey,
    _ displayMode: NavigationBarItem.TitleDisplayMode = .automatic
  ) -> some View {
    NavigationStack {
      self
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(displayMode)
    }
  }

  func navigable(
    _ title: String,
    _ displayMode: NavigationBarItem.TitleDisplayMode = .automatic
  ) -> some View {
    NavigationStack {
      self
        .navigable(LocalizedStringKey(title), displayMode)
    }
  }

  func navigable() -> some View {
    NavigationStack {
      self
    }
  }
}
