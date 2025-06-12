//
//  BrowseExercisesView.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/12/25.
//

import SwiftUI
import SwiftData

struct BrowseExercisesView: View {
    @Query(sort: \PreLoadedExercise.name) var exercises: [PreLoadedExercise]

    var body: some View {
        NavigationStack {
            if exercises.isEmpty {
                Text("No exercises found in SwiftData")
                    .foregroundStyle(.secondary)
                    .onAppear {
                        print("🛑 No Exercises found in SwiftData")
                    }
            } else {
                List(exercises) { exercise in
                    VStack(alignment: .leading) {
                        
                        
                        HStack {
                        // TODO: Add filter functionality
                        // TODO: Add sort functionality
                            
                        }
                        
                        Text(exercise.name)
                            .font(.headline)
                        Text(exercise.primaryMuscles.map { $0.rawValue.capitalized }.joined(separator: ", "))
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .navigationTitle("Browse Exercises")
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: PreLoadedExercise.self, configurations: config)
        let context = container.mainContext
        let example = PreLoadedExercise(
            id: "preview",
            name: "Push Up",
            force: .push,
            level: .beginner,
            mechanic: .compound,
            equipment: .BodyOnly,
            primaryMuscles: [.chest],
            secondaryMuscles: [.triceps],
            instructions: ["Do a push-up"],
            category: .strength
        )
        context.insert(example)

        return BrowseExercisesView()
            .modelContainer(container)
}
