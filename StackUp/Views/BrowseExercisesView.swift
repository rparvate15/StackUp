//
//  BrowseExercisesView.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/12/25.
//

import SwiftUI
import SwiftData

struct BrowseExercisesView: View {
//    @Query(sort: \PreLoadedExercise.name) var exercises: [PreLoadedExercise]
    @Query var exercises: [PreLoadedExercise]

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
    BrowseExercisesView()
}
