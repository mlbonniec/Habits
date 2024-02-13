//
//  HabitsIds.swift
//  Habits
//
//  Created by Mathis Le Bonniec on 12/02/2024.
//

enum HabitsIds {
  case doingGrocery
  case takePublicTransportation

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
  }
}