//
//  ExerciseDetailsView.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/13/25.
//

import SwiftUI

struct ExerciseDetailsView: View {
    var exercise: PreLoadedExercise
    
    var body: some View {
        VStack {
            Text(exercise.name)
                .font(.title)
                .padding(.top)
            Text(exercise.category.rawValue)
                .font(.callout)
                .padding(.bottom)
                .italic()
            Text("Primary Muscles Worked: \(exercise.primaryMuscles.map(\.rawValue).joined(separator: ", "))")
//            if exercise.secondaryMuscles?.count ?? 0 > 0 {
//                Text("Seconday Muscles Worked: \(exercise.secondaryMuscles.map(\.rawValue).joined(separator: ", "))")
//                    .font(.callout)
//                    .foregroundStyle(.secondary)
//            }
            Spacer()
            Text("Instructions:")
                .font(.headline)
            Text(exercise.instructions?.joined(separator: "\n") ?? "HI")
                .padding(.horizontal)
                .multilineTextAlignment(.leading)
            
        }
    }
}

#Preview {
    ExerciseDetailsView(exercise: PreLoadedExercise(id: "PushUps", name: "Push Ups", force: Force.push, level: Level.beginner, mechanic: Mechanic.compound, equipment: Equipment.BodyOnly, primaryMuscles: [Muscles.chest], secondaryMuscles: [Muscles.shoulders, Muscles.triceps], instructions: ["Get down on all fours", "Push up into the air", "Lower yourself back down"], category: ExerciseType.strength))
}
