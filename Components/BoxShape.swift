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
    .background(.white)
    .clipShape(shape)
    .shadow(color: .black.opacity(0.05), radius: 15, y: 10)
    .overlay {
      shape
        .stroke(Color(red: 229 / 255, green: 235 / 255, blue: 237 / 255), lineWidth: 1)
    }
  }

  // MARK: Private Views
  private var shape: RoundedRectangle {
    RoundedRectangle(cornerRadius: 25)
  }
}

#Preview {
  BoxShape {
    Text("Hello, World!")
  }
}
