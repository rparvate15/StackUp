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
    
    @State private var searchText: String = ""
    @State private var showSortSheet: Bool = false
    
    @State private var isReversed: Bool = false
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
        
        return isReversed ? sorted.reversed() : sorted
    }
    @State var sortBy: SortType = .name
    
    var filteredExercises: [PreLoadedExercise] {
        guard !searchText.isEmpty else {
            return sortedExercises
        }
        return sortedExercises.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
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
                
                
                List(filteredExercises) { exercise in
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
                            Text(exercise.force?.rawValue.capitalized ?? "")
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
                .searchable(text: $searchText, placement: .toolbar, prompt: "Search")
                .navigationTitle("Browse Exercises")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu {
                            // Sort options
                            ForEach(SortType.allCases, id: \.self) { sortType in
                                Button {
                                    sortBy = sortType
                                } label: {
                                    Label(
                                        sortType == .primaryMuscles ? "Primary Muscles" : sortType.rawValue.capitalized,
                                        systemImage: sortBy == sortType ? "checkmark" : ""
                                    )
                                }
                            }
                            Divider()
                            // Reverse toggle
                            Button {
                                isReversed.toggle()
                            } label: {
                                Label(
                                    isReversed ? "Ascending" : "Descending",
                                    systemImage: "arrow.up.arrow.down"
                                )
                            }
                        } label: {
                            Image(systemName: "arrow.up.arrow.down")
                        }
                        .accessibilityLabel("Sort Options")
                    }
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
