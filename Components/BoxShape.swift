//
//  BoxShape.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 11/02/2024.
//

import SwiftUI

/// A simple box wrapper for all the app boxes.
/// It includes a rounded corner, a shadow and a border.
struct BoxShape<Content: View>: View {
  // MARK: Properties
  @ViewBuilder let content: Content

  // MARK: Body
  var body: some View {
    HStack(spacing: Constants.Dimensions.xlarge) {
      content
    }
    .padding(.vertical, Constants.Dimensions.large)
    .padding(.horizontal, Constants.Dimensions.xlarge)
    .modifier(BoxAppearance(cornerRadius: 25))
  }
}

#Preview {
  BoxShape {
    Text("Hello, World!")
  }
}
