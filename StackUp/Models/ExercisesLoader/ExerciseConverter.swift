//
//  ExerciseConverter.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/4/25.
//
// Converts ExerciseSeed to PreLoadedExercise

import Foundation

func convertToPreLoadedExercises(seeds: [ExerciseSeed]) -> [PreLoadedExercise] {
    var converted: [PreLoadedExercise] = []

    for seed in seeds {
        // Convert to enums or provide defaults
        let force = ForceChecker(force: seed.force?.lowercased() ?? "null")
        let level = LevelChecker(level: seed.level.lowercased())
        let mechanic = MechanicChecker(mechanic: seed.mechanic?.lowercased() ?? "")
        let equipment = EquipmentChecker(equipment: seed.equipment?.lowercased() ?? "")
        let category = ExerciseTypeChecker(et: seed.category.lowercased())

        let primaryMuscles = seed.primaryMuscles.compactMap { Muscles(rawValue: $0.lowercased()) }
        let secondaryMuscles = seed.secondaryMuscles.compactMap { Muscles(rawValue: $0.lowercased()) }

        let instructions = seed.instructions

        // Create PreLoadedExercise
        let exercise = PreLoadedExercise(
            id: seed.id,
            name: seed.name,
            force: force,
            level: level,
            mechanic: mechanic,
            equipment: equipment,
            primaryMuscles: primaryMuscles,
            secondaryMuscles: secondaryMuscles,
            instructions: instructions,
            category: category
        )

        converted.append(exercise)
    }

    return converted
}

func ForceChecker(force: String) -> Force {
    switch force {
    case "static":
        return Force.constant
    case "pull":
        return Force.pull
    case "push":
        return Force.push
    default:
        return Force.null
    }
}

func LevelChecker(level: String) -> Level {
    switch level {
    case "high":
        return Level.beginner
    case "medium":
        return Level.intermediate
    case "low":
        return Level.expert
    default:
        return Level.intermediate
    }
}

func MechanicChecker(mechanic: String) -> Mechanic {
    switch mechanic {
    case "isolation":
        return Mechanic.isolation
    case "compound":
        return Mechanic.compound
    default:
        return Mechanic.null
    }
}

func EquipmentChecker(equipment: String) -> Equipment {
    switch equipment {
    case "medicine ball":
        return Equipment.MedicineBall
    case "dumbbell":
        return Equipment.Dumbbell
    case "body only":
        return Equipment.BodyOnly
    case "bands":
        return Equipment.Bands
    case "kettlebells":
        return Equipment.Kettlebells
    case "foam roll":
        return Equipment.FoamRoll
    case "cable":
        return Equipment.Cable
    case "machine":
        return Equipment.Machine
    case "barbell":
        return Equipment.Barbell
    case "exercise ball":
        return Equipment.ExerciseBall
    case "e-z curl bar":
        return Equipment.EZCurlBar
    case "other":
        return Equipment.other
    default:
        return Equipment.null
        
    }
}

func ExerciseTypeChecker(et: String) -> ExerciseType {
    switch et {
    case "powerlifting":
        return ExerciseType.strength
    case "strength":
        return ExerciseType.strength
    case "stretching":
        return ExerciseType.flexibility
    case "cardio":
        return ExerciseType.cardio
    case "olympic weightlifting":
        return ExerciseType.strength
    case "strongman":
        return ExerciseType.strength
    case "plyometrics":
        return ExerciseType.flexibility
    default:
        return ExerciseType.other
    }
}
