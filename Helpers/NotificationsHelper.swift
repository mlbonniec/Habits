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

  /// Setup a local notification for the specified day and habit
  /// - Parameters:
  ///   - for The weekday the notification will occurs
  ///   - habitId The habit id for witch the notification will occurs
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

    var dateComponents = DateComponents()

    guard let absoluteWeekdayIndex = weekday.absoluteWeekdayIndex else {
      print("No current weekday index.")
      return
    }

    dateComponents.calendar = Calendar.current
    dateComponents.weekday = absoluteWeekdayIndex
    dateComponents.hour = 9
    dateComponents.minute = 0
    dateComponents.second = 1

    let identifier: String = self.constructNotificationId(weekday: weekday, habitId: habitId)
    let trigger: UNCalendarNotificationTrigger = UNCalendarNotificationTrigger(
      dateMatching: dateComponents,
      repeats: true
    )
    let request: UNNotificationRequest = UNNotificationRequest(
      identifier: identifier,
      content: content,
      trigger: trigger
    )

    print("Notification scheduled on \(weekday) for \(habitId).")

    self.currentNotificationCenter.add(request)
  }

  /// Remove local notification for the specified day and habit
  /// - Parameters:
  ///   - for The weekday the notification will occurs
  ///   - habitId The habit id for witch the notification will occurs
  static func removeHabitNotification(for weekday: Weekdays, habitId: HabitsIds) -> Void {
    let identifier: String = self.constructNotificationId(weekday: weekday, habitId: habitId)

    self.currentNotificationCenter.removePendingNotificationRequests(withIdentifiers: [
      identifier
    ])
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
