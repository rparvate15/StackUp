//
//  WorkoutView.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/20/25.
//

import SwiftUI

struct WorkoutView: View {
    var workout: WorkoutSession
    
    private var dateAndTime: String {
        let dateFormatter = DateFormatter()
        let date = workout.date
         
        // US English Locale (en_US)
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMMd")
        let finalDate = (dateFormatter.string(from: date))
        
        let calendar = Calendar.current
        let hour: Int = calendar.component(.hour, from: date)
        
        var tod: String
        if hour <= 6 {
            tod = "Early Morning"
        } else if hour < 12 {
            tod = "Morning"
        } else if hour < 16 {
            tod = "Afternoon"
        } else if hour < 20 {
            tod = "Evening"
        } else {
            tod = "Night"
        }
        
        var finalString = ""
        finalString.append(contentsOf: finalDate)
        finalString.append("'s \(tod) Workout")
        
        
        return finalString
    }
    
    var body: some View {
        VStack {
            Text(dateAndTime)
                .font(.title2)
                .padding(.top, 50)
            Text(workout.name ?? "")
                .font(.headline)
                .padding()
            Spacer()
            
            LazyVStack (alignment: .leading) {
                ForEach(workout.exercises) { exercise in
                    UserExerciseCardView(exercise: exercise)
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    WorkoutView(workout: WorkoutSession(date: Date(timeIntervalSinceNow: 46829), name: "Test Workout", exercises: [WorkoutExercise(exercise: PreLoadedExercise(id: "pushups", name: "Push Ups", force: Force.push, level: Level.beginner, mechanic: Mechanic.compound, equipment: Equipment.BodyOnly, primaryMuscles: [Muscles.chest], secondaryMuscles: [Muscles.shoulders, Muscles.triceps], instructions: ["Test"], category: ExerciseType.strength), sets: [ExerciseSet(reps: 10, weight: 100)])], effort: 7))
}
