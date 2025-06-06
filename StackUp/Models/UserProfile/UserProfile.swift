//
//  UserProfile.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/6/25.
//

import Foundation

class UserProfile: Codable {
    let id: UUID
    var name: String
    var DOB: Date // date of birth, to calculate age
    var gender: Gender = Gender.notSet
    var weight: Double
    var height: Double?
    var goalOverall: WorkoutGoal
    // TODO: Create a secondary Goal thing that goes off goalOverall (loseAllCosts, DirtyBulk, etc (check freeform board)
    var notificationsEnabled: Bool = false
    var profileCreated: Date
    var lastUpdatedMetrics: Date?
    var lastUpdatedGoal: Date
    
    init(id: UUID, name: String, DOB: Date, gender: Gender, weight: Double, height: Double? = nil, goalOverall: WorkoutGoal, notificationsEnabled: Bool, profileCreated: Date = Date(), lastUpdatedMetrics: Date? = nil, lastUpdatedGoal: Date) {
        self.id = id
        self.name = name
        self.DOB = DOB
        self.gender = gender
        self.weight = weight
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
