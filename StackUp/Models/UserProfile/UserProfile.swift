//
//  UserProfile.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/6/25.
//

import Foundation
import SwiftData

@Model
final class UserProfile {
    var name: String
    var DOB: Date // date of birth, to calculate age
    var gender: Gender = Gender.notSet
    var weight: Double
    var weightUnits: WeightUnits = WeightUnits.pounds
    var height: Double?
    var goalOverall: WorkoutGoal
    // TODO: Create a secondary Goal thing that goes off goalOverall (loseAllCosts, DirtyBulk, etc (check freeform board)
    var notificationsEnabled: Bool = false
    var profileCreated: Date
    var lastUpdatedMetrics: Date?
    var lastUpdatedGoal: Date
    
    init(name: String, DOB: Date, gender: Gender, weight: Double, weightUnits: WeightUnits? = WeightUnits.pounds, height: Double? = nil, goalOverall: WorkoutGoal, notificationsEnabled: Bool, profileCreated: Date = Date(), lastUpdatedMetrics: Date? = nil, lastUpdatedGoal: Date) {
        self.name = name
        self.DOB = DOB
        self.gender = gender
        self.weight = weight
        self.weightUnits = weightUnits ?? .pounds
        self.height = height
        self.goalOverall = goalOverall
        self.notificationsEnabled = notificationsEnabled
        self.profileCreated = profileCreated
        self.lastUpdatedMetrics = lastUpdatedMetrics
        self.lastUpdatedGoal = lastUpdatedGoal
    }
    
    var age: Int {
        Calendar.current.dateComponents([.year], from: DOB, to: Date()).year ?? 0
    }
}

enum Gender: Int, Codable {
    case notSet
    case male
    case female
    case other
}

enum WeightUnits : String, Codable {
    case pounds
    case kilograms
}
