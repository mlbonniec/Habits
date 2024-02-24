//
//  HabitsNotificationsDelegate.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 24/02/2024.
//

import UIKit
import SwiftUI

class HabitsNotificationsDelegate: NSObject, ObservableObject {
  // MARK: Published Properties
  @Published var shownDetails: HabitsIds?

  // MARK: Lifecycle
  override init() {
    super.init()

    NotificationsHelper.currentNotificationCenter.delegate = self
  }
}

extension HabitsNotificationsDelegate: UNUserNotificationCenterDelegate {
  // MARK: Methods
  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    completionHandler([.banner, .sound])
  }

  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse,
    withCompletionHandler completionHandler: @escaping () -> Void
  ) {
    let userInfo: [AnyHashable: Any] = response.notification.request.content.userInfo
    guard let stringView: String = userInfo[NotificationsHelper.UserInfo.Keys.view.rawValue] as? String,
          let view: NotificationsHelper.UserInfo.Values = NotificationsHelper.UserInfo.Values(rawValue: stringView),
          let stringId: String = userInfo[NotificationsHelper.UserInfo.Keys.id.rawValue] as? String,
          let habitId: HabitsIds = HabitsIds(rawValue: stringId) else {
      return
    }

    shownDetails = habitId

    completionHandler()
  }
}
