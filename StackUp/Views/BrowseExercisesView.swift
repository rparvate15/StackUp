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
    
    var sortedExercises: [PreLoadedExercise] {
        let sorted: [PreLoadedExercise]
        
        switch sortBy {
        case .name:
            sorted = exercises.sorted { $0.name < $1.name }
        case .primaryMuscles:
            sorted = exercises.sorted { $0.primaryMuscles.count > $1.primaryMuscles.count }
        case .difficulty:
            sorted = exercises.sorted { $0.level.rawValue < $1.level.rawValue }
        case .category:
            sorted = exercises.sorted { $0.category.rawValue < $1.category.rawValue }
        case .force:
            sorted = exercises.sorted { ($0.force?.rawValue ?? "") < ($1.force?.rawValue ?? "") }
        case .equipment:
            sorted = exercises.sorted { $0.equipment.rawValue < $1.equipment.rawValue }
        }

        return sorted
    }
    @State var sortBy: SortType = .name

    var body: some View {
        NavigationStack {
            if exercises.isEmpty {
                Text("No exercises found in SwiftData")
                    .foregroundStyle(.secondary)
                    .onAppear {
                        print("🛑 No Exercises found in SwiftData")
                    }
            } else {
                
//                // TODO: Add filter functionality
               
                
                List(sortedExercises) { exercise in
                    VStack(alignment: .leading) {
                        Text(exercise.name)
                            .font(.headline)
                        
                        switch sortBy {
                        case .difficulty:
                            Text(exercise.level.rawValue.capitalized)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        case .category:
                            Text(exercise.category.rawValue.capitalized)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        case .force:
                            Text(exercise.force?.rawValue ?? "")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        case .equipment:
                            Text(exercise.equipment.rawValue.capitalized)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        default:
                            Text(exercise.primaryMuscles.map { $0.rawValue.capitalized }.joined(separator: ", "))
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .navigationTitle("Browse Exercises")
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Picker(selection: $sortBy, label:
                                Image(systemName: "arrow.up.arrow.down.circle")
                            .font(.title2)
                            .foregroundStyle(.blue)
                        ) {
                            ForEach(SortType.allCases, id: \.self) { sortType in
                                if sortType == .primaryMuscles {
                                    Text("Primary Muscles")
                                } else {
                                    Text(sortType.rawValue.capitalized)
                                }
                            }
                        }
                    }
                    // TODO: Make this a circle
                    // TODO: Add searchable
                }
            }
        }
    }
}

enum SortType: String, CaseIterable {
    case name, primaryMuscles, difficulty, category, force, equipment
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
