//
//  InlinePicker.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 12/02/2024.
//

import SwiftUI

/// The protocol used for the InlinePicker component.
/// Values displayed in the picker must conform to this protocol.
protocol InlinePickerValue: RawRepresentable<String>, CaseIterable, Equatable, Hashable {
  /// A short string of the value, used to be displayed in the picker.
  var short: String { get }
}

struct InlinePicker<Value: InlinePickerValue>: View {
  // MARK: Properties
  let values: [Value]
  @Binding var selected: Set<Value>

  // MARK: Body
  var body: some View {
    return LazyVGrid(
      columns: Array(repeating: GridItem(.flexible()), count: values.count),
      spacing: Constants.Dimensions.small
    ) {
      ForEach(values, id: \.rawValue) { value in
        Button(action: {
          withAnimation {
            if selected.contains(value) {
              selected.remove(value)
            } else {
              selected.insert(value)
            }
          }
          HapticHelper.selectionChanged()
        }) {
          getValueColor(isActive: selected.contains(value))
            .aspectRatio(1, contentMode: .fit)
            .overlay {
              Text(value.short)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(selected.contains(value) ? .white : .black)
            }
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: .black.opacity(0.05), radius: 15, y: 10)
            .overlay {
              RoundedRectangle(cornerRadius: 15)
                .stroke(Color(red: 229 / 255, green: 235 / 255, blue: 237 / 255), lineWidth: 1)
                .aspectRatio(1, contentMode: .fill)
            }
        }
        .buttonStyle(.plain)
      }
    }
    .onAppear {
      HapticHelper.selection.prepare()
    }
  }

  // MARK: Private Method
  func getValueColor(isActive: Bool) -> some View {
    if !isActive {
      return AnyView(Color.white)
    }

    return AnyView(
      LinearGradient(
        colors: [.accentColor.opacity(0.75), .accentColor],
        startPoint: .top,
        endPoint: .bottom
      )
    )
  }
}

#Preview {
  enum WeekdaysDemo: String, InlinePickerValue {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday

    var short: String {
      String(self.rawValue.prefix(3)).capitalized
    }
  }

  return InlinePicker(
    values: WeekdaysDemo.allCases,
    selected: .constant(Set([.thursday, .sunday]))
  )
  .padding()
}
