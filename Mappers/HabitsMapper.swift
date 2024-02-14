//
//  HabitsMapper.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 12/02/2024.
//

enum HabitsMapper {
  static func map() -> [HabitsModel] {
    [
      HabitsModel(
        id: .doingGrocery,
        systemImage: "bag.fill",
        description: nil,
        steps: [
          HabitsModel.Step(
            id: .doingGroceryList,
            label: "Make a list",
            description: "Write every item you need to buy."
          ),
          HabitsModel.Step(
            id: .doingGroceryLeaveTheHouse,
            label: "Leave the house",
            description: "Don't forget to take bags."
          ),
          HabitsModel.Step(
            id: .doingGroceryTakeTransports,
            label: "Take a transport",
            description: "Don't forget to buy a ticket."
          ),
          HabitsModel.Step(
            id: .doingGroceryPickProducts,
            label: "Pick the product",
            description: "Choose every item from your list."
          ),
          HabitsModel.Step(
            id: .doingGroceryPay,
            label: "Pay your products",
            description: "Go to the checkout, and pay your groceries."
          )
        ]
      ),
      HabitsModel(
        id: .takePublicTransportation,
        systemImage: "bus.fill",
        description: "Bus, metro, tramway…",
        steps: [
          HabitsModel.Step(
            id: .takePublicTransportationHeadForAStop,
            label: "Head for a stop",
            description: "Walk to the nearest stop around you."
          ),
          HabitsModel.Step(
            id: .takePublicTransportationLookForPlanAndSchedule,
            label: "Look for plan and schedule",
            description: "Choose the schedule according to your destination."
          ),
          HabitsModel.Step(
            id: .takePublicTransportationWaitFor,
            label: "Wait",
            description: "Wait until the transport arrives. It can take times."
          ),
          HabitsModel.Step(
            id: .takePublicTransportationGetInto,
            label: "Get into",
            description: "Once the transport has arrived, get into it."
          ),
          HabitsModel.Step(
            id: .takePublicTransportationPay,
            label: "Pay",
            description: "Use your prepaid transport card, or buy a ticket."
          ),
          HabitsModel.Step(
            id: .takePublicTransportationGetOff,
            label: "Get off",
            description: "Once arrived at your stop destination, get off."
          )
        ]
      )
    ]
  }

  static func mapById(id: HabitsIds) -> HabitsModel? {
    return self.map().first { $0.id == id }
  }

  static func mock() -> HabitsModel {
    HabitsModel(
      id: .doingGrocery,
      systemImage: "bag.fill",
      description: "Learn how to do groceries efficiency.",
      steps: [
        HabitsModel.Step(id: .doingGroceryList, label: "Make a list"),
        HabitsModel.Step(id: .doingGroceryLeaveTheHouse, label: "Leave the houst"),
        HabitsModel.Step(id: .doingGroceryTakeTransports, label: "Take a transport"),
        HabitsModel.Step(id: .doingGroceryPickProducts, label: "Pick the product"),
        HabitsModel.Step(id: .doingGroceryPay, label: "Pay your products")
      ]
    )
  }
}
