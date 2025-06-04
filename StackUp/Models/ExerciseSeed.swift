//
//  ExerciseSeed.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/4/25.
//

import Foundation

struct ExerciseSeed: Codable, Identifiable {
    var id: String
    var name: String
    var force: String?
    var level: String
    var mechanic: String?
    var equipment: String?
    var primaryMuscles: [String]
    var secondaryMuscles: [String]
    var instructions: [String]
    var category: String
    var images: [String]
}
