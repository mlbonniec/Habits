//
//  HabitsIds.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 12/02/2024.
//

import RealmSwift

enum HabitsIds: String, Identifiable, PersistableEnum {
  case doingGrocery = "Doing grocery"
  case takePublicTransportation = "Take a public transportation"
  case takeMedication = "Take medication"
  case prepareFood = "Cook a recipe"
  case washingClothes = "Washing clothes"
  case cleaningTheHouse = "Cleaning the house"

  var id: String {
    self.rawValue
  }

  enum Steps {
    // MARK: doingGrocery
    case doingGroceryList
    case doingGroceryLeaveTheHouse
    case doingGroceryTakeTransports
    case doingGroceryPickProducts
    case doingGroceryPay

    // MARK: takePublicTransportation
    case takePublicTransportationHeadForAStop
    case takePublicTransportationLookForPlanAndSchedule
    case takePublicTransportationWaitFor
    case takePublicTransportationGetInto
    case takePublicTransportationPay
    case takePublicTransportationGetOff

    // MARK: takeMedication
    case takeMedicationTakePrescription
    case takeMedicationGoToThePharmacy
    case takeMedicationStoringDrugs
    case takeMedicationPrepareWater
    case takeMedicationTakeDrugs

    // MARK: prepareFood
    case prepareFoodChooseYourMeal
    case prepareFoodPrepareRecipe
    case prepareFoodCollectIngredients
    case prepareFoodTurnOnCookingAppliance
    case prepareFoodFollowInstructions
    case prepareFoodTurnOffCookingAppliance
    case prepareFoodEat

    // MARK: washingClothes
    case washingClothesSortLaundry
    case washingClothesFillWashingMachine
    case washingClothesAddWashingPowder
    case washingClothesSelectWashingCycle
    case washingClothesStart
    case washingClothesDry

    // MARK: cleaningTheHouse
    case cleaningTheHouseFeatherDuster
    case cleaningTheHouseVacuumCleaner
    case cleaningTheHouseWindows
  }
}
