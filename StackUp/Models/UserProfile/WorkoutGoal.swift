//
//  WorkoutGoal.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/6/25.
//

import Foundation

enum WorkoutGoal: String, CaseIterable, Encodable, Decodable, RawRepresentable, Hashable {
    case open
    // body weight options
    case loseWeight // lose at all costs, lose sustainably, lose while increasing strength?
    case gainWeight // gain at all costs, gain sustainable, clean/dirty bulk?
    
    // general total in day options (steps per day, miles/kilometers per day)
    case moreStepsTotal
    case moreDistanceTotal
    
    // increase cardio stats for a cardio workout (make sure to set a cardio workout to tie the goal to)
    case moreDistanceCardio
    case moreDurationCardio
    case betterIntervalCardio
    
    // increase weightlifting/strength stats (make sure to set a strength workout to tie the goal to)
    // for certain body part?
    case moreRepsStrength
    case moreSetsStrength
    case moreWeightStrength // try to calculate effort to see if overall strength increases?
}
