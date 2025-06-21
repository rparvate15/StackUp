//
//  UserExerciseCardView.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/21/25.
//

import SwiftUI

struct UserExerciseCardView: View {
    var exercise: WorkoutExercise
    
    var body: some View {
//        NavigationLink(destination: destination) { // TODO: Replace inside NavigationLink ()'s with destination to ExerciseDetails
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(exercise.exercise.name)
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text(exercise.sets.count != 1 ? exercise.sets.count.description + " sets" : "1 set")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                switch exercise.exercise.category {
                case .strength:
                    Image(systemName: "figure.strengthtraining.traditional.circle")
                        .font(.title)
                        .foregroundColor(.accentColor)
                case .cardio:
                    Image(systemName: "figure.run.circle")
                        .font(.title)
                        .foregroundColor(.accentColor)
                case .flexibility:
                    Image(systemName: "figure.yoga.circle")
                        .font(.title)
                        .foregroundColor(.accentColor)
                case .other:
                    Image(systemName: "ellipsis.circle")
                        .font(.title)
                        .foregroundColor(.accentColor)

                }
                
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 120)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .shadow(radius: 3)
            .padding(.horizontal)
//        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    let exercise = WorkoutExercise(exercise: PreLoadedExercise(id: "pushup", name: "Push Up", force: Force.push, level: Level.beginner, mechanic: Mechanic.compound, equipment: Equipment.BodyOnly, primaryMuscles: [Muscles.chest], secondaryMuscles: [Muscles.triceps, Muscles.shoulders], instructions: ["Test 1", "Test 2"], category: ExerciseType.strength), sets: [ExerciseSet(reps: 20)])
    
    UserExerciseCardView(exercise: exercise)
}
