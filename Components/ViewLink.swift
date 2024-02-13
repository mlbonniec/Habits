//
//  ViewLink.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 11/02/2024.
//

import SwiftUI

/// A wrapper for the NavigationLink component to remove the right chevron.
/// - Parameters:
///   - destination: A view for the navigation link to present.
///   - label: A view builder to produce a label describing the `destination` to present.
///
struct ViewLink<Destination: View, Content: View>: View {
  // MARK: Properties
  @ViewBuilder let destination: () -> Destination
  @ViewBuilder let content: () -> Content

  // MARK: Body
  var body: some View {
    ZStack {
      content()

      NavigationLink(destination: destination) {
        EmptyView()
      }
      .opacity(0)
    }
  }
}
