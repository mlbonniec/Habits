//
//  HabitDetailsView.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 11/02/2024.
//

import SwiftUI
import RealmSwift
import TipKit

struct HabitDetailsView: View {
  // MARK: Properties
  private let habit: HabitsModel

  // MARK: Reactive Properties
  @Environment(\.dismiss) private var dismiss: DismissAction
  @State private var steps: [Bool]
  @State private var showScheduling: Bool = false
  @Environment(\.realm) private var realm: Realm

  init(habit: HabitsModel) {
    self.habit = habit
    self._steps = State(initialValue: Array(repeating: false, count: habit.steps.count))
  }

  // MARK: Body
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: Constants.Dimensions.xlarge * 2) {
        HabitsView
        StepsView
        ActionsView

        Spacer(minLength: 0)
      }
      .padding(.horizontal, Constants.Dimensions.medium)
    }
    .backgroundGradient()
    .navigationBarBackButtonHidden()
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .topBarTrailing) {
        CloseButton(action: dismiss.callAsFunction)
      }
    }
    .sheet(isPresented: $showScheduling) {
      HabitSchedulingFactory.createView(habit: habit)
    }
  }

  // MARK: Private Views
  private var HabitsView: some View {
    GroupBox("Habit") {
      HabitsListRowView(
        systemImage: habit.systemImage,
        label: habit.id.rawValue,
        description: habit.description
      )
      .hideChevron()
    }
    .groupBoxStyle(GroupBoxHabitStyle())
  }

  private var StepsView: some View {
    GroupBox("Steps") {
      if #available(iOS 17.0, *) {
        TipView(HabitDetailsStepsTip(), arrowEdge: .bottom)
          .tipImageSize(CGSize(width: 35, height: 35))
      }

      ForEach(Array(habit.steps.enumerated()), id: \.offset) { id, step in
        HabitDetailsItemView(
          label: step.label,
          description: step.description,
          isOn: $steps[id]
        )
        .opacity(id == 0 || steps[id - 1] ? 1 : 0.5)
        .allowsHitTesting(id == 0 || (id != 0 && steps[id - 1]))
      }
      .onChange(of: steps) { _ in
        var hasFoundLatestFalse: Bool = false

        steps.enumerated().forEach { id, step in
          if !step && !hasFoundLatestFalse {
            hasFoundLatestFalse = true
          }
          if hasFoundLatestFalse {
            steps[id] = false
          }
        }

        if steps.allSatisfy({ $0 }) {
          HapticHelper.notification.prepare()
        }
      }
    }
    .groupBoxStyle(GroupBoxHabitStyle())
  }

  private var ActionsView: some View {
    GroupBox("Actions") {
      Button("Mark as completed") {
        try? realm.write {
          let model: HabitsHistoryModel = HabitsHistoryModel(id: habit.id)

          realm.add(model)

          HapticHelper.success()
        }

        dismiss()
      }
      .buttonStyle(ButtonHabitStyle())
      .disabled(steps.contains { !$0 })

      Button("Schedule") {
        showScheduling.toggle()
      }
      .buttonStyle(ButtonHabitStyle(color: Color(red: 238/255, green: 66/255, blue: 102/255)))
    }
    .groupBoxStyle(GroupBoxHabitStyle())
  }
}

#Preview {
  let habit: HabitsModel = HabitsMapper.mock()

  return HabitDetailsFactory.createView(habit: habit)
}
