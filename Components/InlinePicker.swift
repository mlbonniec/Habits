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
  // MARK: Private Properties
  private let values: [Value]
  private let handlingMultipleValues: Bool

  // MARK: Reactive Properties
  @Binding private var selectedValues: Set<Value>
  @Binding private var selectedValue: Value?

  // MARK: Lifecycle
  init(values: [Value], selected: Binding<Set<Value>>) {
    self.handlingMultipleValues = true
    self.values = values
    self._selectedValue = .constant(nil)
    self._selectedValues = selected
  }

  init(values: [Value], selected: Binding<Value?>) {
    self.handlingMultipleValues = false
    self.values = values
    self._selectedValue = selected
    self._selectedValues = .constant([])
  }

  // MARK: Body
  var body: some View {
    return LazyVGrid(
      columns: Array(repeating: GridItem(.flexible()), count: values.count),
      spacing: Constants.Dimensions.small
    ) {
      ForEach(values, id: \.rawValue) { value in
        Button(action: {
          didClickDay(value: value)
        }) {
          getValueColor(value: value)
            .aspectRatio(1, contentMode: .fit)
            .overlay {
              Text(value.short)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(self.hasValue(value) ? .white : .black)
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
  func didClickDay(value: Value) {
    withAnimation {
      if handlingMultipleValues {
        self.didClickMultipleDay(value: value)
      } else {
        self.didClickUniqueDay(value: value)
      }
    }

    HapticHelper.selectionChanged()
  }

  func didClickMultipleDay(value: Value) {
    if self.hasValue(value) {
      selectedValues.remove(value)
    } else {
      selectedValues.insert(value)
    }
  }

  func didClickUniqueDay(value: Value) {
    selectedValue = selectedValue == value ? nil : value
  }

  func getValueColor(value: Value) -> some View {
    if !self.hasValue(value) {
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

  func hasValue(_ value: Value) -> Bool {
    return handlingMultipleValues ? selectedValues.contains(value) : selectedValue == value
  }
}

#Preview("Multiple selection") {
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

#Preview("Unique selection") {
  enum WeekdaysDemo: String, InlinePickerValue {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday

    var short: String {
      String(self.rawValue.prefix(3)).capitalized
    }
  }

  return InlinePicker(
    values: WeekdaysDemo.allCases,
    selected: .constant(.monday)
  )
  .padding()
}
