//
//  HapticHelper.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 12/02/2024.
//

import UIKit

enum HapticHelper {
  static let notification: UINotificationFeedbackGenerator = UINotificationFeedbackGenerator()
  static let impact: UIImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)
  static let selection: UISelectionFeedbackGenerator = UISelectionFeedbackGenerator()

  /// A feedback impact.
  static func impactOccurred() -> Void {
    impact.impactOccurred()
  }

  /// A notification feedback that indicate a success.
  static func success() -> Void {
    notification.notificationOccurred(.success)
  }

  /// A feedback that indicate a selection change.
  static func selectionChanged() {
    selection.selectionChanged()
  }
}
