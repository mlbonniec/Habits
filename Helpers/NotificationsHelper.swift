//
//  NotificationsHelper.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 20/02/2024.
//

import Foundation
import UserNotifications
import UIKit

enum NotificationsHelper {
  static let currentNotificationCenter: UNUserNotificationCenter = UNUserNotificationCenter.current()

  static func requestPermission(completionHandler: @escaping (Bool, Error?) -> Void) -> Void {
    self.currentNotificationCenter.requestAuthorization(
      options: [.alert, .badge, .sound],
      completionHandler: completionHandler
    )
  }

  static func setupHabitNotification(for weekday: Weekdays, habitId: HabitsIds) -> Void {
    let content: UNMutableNotificationContent = UNMutableNotificationContent()
    content.title = habitId.rawValue
    content.badge = 1
    content.body = "Don't forget to do this habit."
    content.sound = UNNotificationSound.default

    if let habit = HabitsMapper.mapById(id: habitId),
       let description = habit.description {
      content.subtitle = description
    }

    let identifier: String = self.constructNotificationId(weekday: weekday, habitId: habitId)
    let trigger: UNTimeIntervalNotificationTrigger = UNTimeIntervalNotificationTrigger(
      timeInterval: 5,
      repeats: false
    )

    let request: UNNotificationRequest = UNNotificationRequest(
      identifier: identifier,
      content: content,
      trigger: trigger
    )

    self.currentNotificationCenter.add(request)
  }

  /// Set the application badge count to 0
  static func resetBadgeCount() -> Void {
    self.currentNotificationCenter.setBadgeCount(0)
  }

  /// Construct a notification id string from weekday and habit id
  /// - Parameters:
  ///   - weekday The weekday the notification will occurs
  ///   - habit The habit for witch the notification will occurs
  /// - Returns:
  ///   - A unique string ID for the given weekday and habit
  private static func constructNotificationId(weekday: Weekdays, habitId: HabitsIds) -> String {
    return [weekday.rawValue, habitId.rawValue].joined(separator: "-")
  }
}
