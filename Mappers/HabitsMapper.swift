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
      ),
      HabitsModel(
        id: .takeMedication,
        systemImage: "pills.fill",
        steps: [
          HabitsModel.Step(
            id: .takeMedicationTakePrescription,
            label: "Take prescription",
            description: "Pick up the prescription written by the doctor."
          ),
          HabitsModel.Step(
            id: .takeMedicationGoToThePharmacy,
            label: "Go to the pharmacy",
            description: "Pick up your medication."
          ),
          HabitsModel.Step(
            id: .takeMedicationStoringDrugs,
            label: "Store the drug",
            description: "Back home, safely store your drug."
          ),
          HabitsModel.Step(
            id: .takeMedicationPrepareWater,
            label: "Prepare water",
            description: "Fill a glass with water for the next step."
          ),
          HabitsModel.Step(
            id: .takeMedicationTakeDrugs,
            label: "Take drug",
            description: "Swallow the drug with a glass of water"
          )
        ]
      ),
      HabitsModel(
        id: .prepareFood,
        systemImage: "fork.knife",
        steps: [
          HabitsModel.Step(
            id: .prepareFoodChooseYourMeal,
            label: "Choose your meal"
          ),
          HabitsModel.Step(
            id: .prepareFoodPrepareRecipe,
            label: "Prepare the recipe",
            description: "You can find the recipe on internet."
          ),
          HabitsModel.Step(
            id: .prepareFoodCollectIngredients,
            label: "Collect ingredients",
            description: "Gather all the ingredients."
          ),
          HabitsModel.Step(
            id: .prepareFoodTurnOnCookingAppliance,
            label: "Turn on cooking appliance",
            description: "Turn on the hob, oven, barbecue… according to your needs."
          ),
          HabitsModel.Step(
            id: .prepareFoodFollowInstructions,
            label: "Follow instructions",
            description: "Carefully follow the recipe."
          ),
          HabitsModel.Step(
            id: .prepareFoodTurnOffCookingAppliance,
            label: "Turn off cooking appliance",
            description: "Do not forget to turn off the cooking appliance once used!"
          ),
          HabitsModel.Step(
            id: .prepareFoodEat,
            label: "Eat"
          )
        ]
      ),
      HabitsModel(
        id: .washingClothes,
        systemImage: "washer.fill",
        steps: [
          HabitsModel.Step(
            id: .washingClothesSortLaundry,
            label: "Sort your laundry",
            description: "Sort them by color, preferably light and dark."
          ),
          HabitsModel.Step(
            id: .washingClothesFillWashingMachine,
            label: "Adding laundry to the washer",
            description: "Choose one of the previously sorted laundry bundles."
          ),
          HabitsModel.Step(
            id: .washingClothesAddWashingPowder,
            label: "Adding washing powder",
            description: "Carefully read the instructions on the packaging."
          ),
          HabitsModel.Step(
            id: .washingClothesSelectWashingCycle,
            label: "Select washing cycle",
            description: "Look at the tags on clothes: they indicate the cycle to use."
          ),
          HabitsModel.Step(
            id: .washingClothesStart,
            label: "Start the washer",
            description: "Close the washer door and start it."
          ),
          HabitsModel.Step(
            id: .washingClothesDry,
            label: "Dry your clothes",
            description: "Once washed, dry with a tumble dryer, or lay out on a drying rack."
          )
        ]
      ),
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
