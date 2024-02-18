//
//  InlinePicker.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 12/02/2024.
//

import SwiftUI

/// The protocol used for the InlinePicker component.
/// Values displayed in the picker must conform to this protocol.
protocol InlinePickerValue: RawRepresentable<String>, Equatable, Hashable, Identifiable {
  /// A short string of the value, used to be displayed in the picker.
  var short: String { get }
}

struct InlinePicker<Value: InlinePickerValue>: View {
  // MARK: Private Properties
  private let values: [Value]
  private let handlingMultipleValues: Bool
  private let indicators: Set<Value>

  // MARK: Reactive Properties
  @Environment(\.colorScheme) private var colorScheme: ColorScheme
  @Binding private var selectedValues: Set<Value>
  @Binding private var selectedValue: Value?

  // MARK: Lifecycle
  init(values: [Value], selected: Binding<Set<Value>>, indicators: Set<Value> = []) {
    self.handlingMultipleValues = true
    self.values = values
    self.indicators = indicators
    self._selectedValue = .constant(nil)
    self._selectedValues = selected

  }

  init(values: [Value], selected: Binding<Value?>, indicators: Set<Value> = []) {
    self.handlingMultipleValues = false
    self.values = values
    self.indicators = indicators
    self._selectedValue = selected
    self._selectedValues = .constant([])
  }

  // MARK: Body
  var body: some View {
    return LazyVGrid(
      columns: Array(repeating: GridItem(.flexible()), count: values.count),
      spacing: Constants.Dimensions.small
    ) {
      ForEach(values) { value in
        VStack(spacing: Constants.Dimensions.medium) {
          Button(action: {
            didClickDay(value: value)
          }) {
            getValueColor(value: value)
              .aspectRatio(1, contentMode: .fit)
              .overlay {
                Text(value.short)
                  .font(.caption)
                  .fontWeight(.semibold)
                  .foregroundStyle(self.getDayForegroundColor(value: value))
              }
              .modifier(BoxAppearance(cornerRadius: 15))
          }
          .buttonStyle(.plain)

          if indicators.contains(value) {
            Circle()
              .frame(width: 5, height: 5)
              .foregroundColor(.black.opacity(0.25))
          } else if !indicators.isEmpty {
            Spacer(minLength: 0)
          }
        }
      }
    }
    .onAppear {
      HapticHelper.selection.prepare()
    }
  }

  // MARK: Private Method
  func getDayForegroundColor(value: Value) -> Color {
    guard colorScheme != .dark else { return .white }

    return self.hasValue(value) ? Constants.Colors.primary : Constants.Colors.text
  }

  func didClickDay(value: Value) {
    withAnimation(.spring) {
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
      return AnyView(Constants.Colors.primary)
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
  enum WeekdaysDemo: String, CaseIterable, InlinePickerValue {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday

    var id: String {
      self.rawValue
    }

    var short: String {
      String(self.rawValue.prefix(3)).capitalized
    }
  }

  return InlinePicker(
    values: WeekdaysDemo.allCases,
    selected: .constant(Set([.thursday, .sunday])),
    indicators: [.friday]
  )
  .padding()
}

#Preview("Unique selection") {
  enum WeekdaysDemo: String, CaseIterable, InlinePickerValue {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday

    var id: String {
      self.rawValue
    }

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
