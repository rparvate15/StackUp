//
//  UserExerciseDetailsView.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/21/25.
//

import SwiftUI

struct UserExerciseDetailsView: View {
    var exercise: WorkoutExercise
    
    var body: some View {
        VStack {
            Text(exercise.exercise.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
            Text(exercise.exercise.category.rawValue)
                .font(.subheadline)
                .padding()
            Divider()
            Spacer()
            LazyVStack {
                ForEach(exercise.sets) { set in
                    if set.reps != nil || set.weight != nil {
                        if exercise.exercise.equipment != .BodyOnly{
                            Text("\(set.reps ?? 0) reps at \(Int(set.weight ?? 0)) lbs")
                        } else { Text("\(set.reps ?? 0) reps") }
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    let exercise = WorkoutExercise(exercise: PreLoadedExercise(id: "pushup", name: "Push Up", force: Force.push, level: Level.beginner, mechanic: Mechanic.compound, equipment: Equipment.BodyOnly, primaryMuscles: [Muscles.chest], secondaryMuscles: [Muscles.triceps, Muscles.shoulders], instructions: ["Test 1", "Test 2"], category: ExerciseType.strength), sets: [ExerciseSet(reps: 20)], effort: 8)
    
    UserExerciseDetailsView(exercise: exercise)
}
