//
//  Equipment.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/4/25.
//

import Foundation

enum Equipment: String, CaseIterable, Encodable, Decodable {
    case MedicineBall
    case Dumbbell
    case BodyOnly
    case Bands
    case Kettlebells
    case FoamRoll
    case Cable
    case Machine
    case Barbell
    case ExerciseBall
    case EZCurlBar
    case other
    case null
}
