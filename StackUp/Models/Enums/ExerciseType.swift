//
//  ExerciseType.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/2/25.
//

import Foundation

enum ExerciseType: String, CaseIterable, Encodable, Decodable, RawRepresentable, Hashable {
    case strength
    case cardio
    case flexibility
    case other
}
