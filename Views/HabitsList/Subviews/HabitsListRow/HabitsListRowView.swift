//
//  HabitsListRowView.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 10/02/2024.
//

import SwiftUI

struct HabitsListRowView: View {
  // MARK: Properties
  let systemImage: String
  let label: String
  var description: String? = nil

  // MARK: Private Properties
  @ObservedObject private var configuration: HabitsListRowConfiguration = HabitsListRowConfiguration()

  // MARK: Body
  var body: some View {
    BoxShape {
      Circle()
        .foregroundStyle(.tint.opacity(0.15))
        .frame(width: 45, height: 45)
        .overlay {
          Image(systemName: systemImage)
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundStyle(.tint)
        }

      VStack(alignment: .leading, spacing: Constants.Dimensions.tiny) {
        Text(label)
          .fontWeight(.semibold)

        if let description {
          Text(description)
            .font(.callout)
            .fontWeight(.light)
            .foregroundStyle(.gray)
        }
      }

      Spacer(minLength: 0)

      if configuration.showChevron {
        Image(systemName: "chevron.right")
          .opacity(0.25)
      }
    }
  }

  // MARK: Private Views
  private var shape: RoundedRectangle {
    RoundedRectangle(cornerRadius: 25)
  }

  // MARK: Public Methods
  func hideChevron() -> HabitsListRowView {
    configuration.showChevron = false
    return self
  }
}

#Preview("Shown Chevron with description") {
  HabitsListRowView(
    systemImage: "bag.fill",
    label: "Going shopping",
    description: "Hello, World"
  )
  .padding()
}

#Preview("Hidden Chevron without description") {
  HabitsListRowView(
    systemImage: "bag.fill",
    label: "Going shopping"
  )
  .hideChevron()
  .padding()
}
