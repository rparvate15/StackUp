//
//  ContentView.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/2/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var showingProfile = false
    @Query private var items: [Item]

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.vertical, showsIndicators: false){
                    CardView(title: "Today", subtitle: "Today's Workout", iconName: "calendar", destination: AnyView(Text("Test")))
                    // TODO: replace AnyView with Today View
                    
                    
                    CardView(title: "Browse", subtitle: "Browse through all exercises", iconName: "list.clipboard", destination: AnyView(BrowseExercisesView()))
                    
                    CardView(title: "Goals", subtitle: "View your goals and goal history", iconName: "chart.bar.fill", destination: AnyView(Text("test")))
                    // TODO: replace AnyView with Goals View
                    
                    CardView(title: "History", subtitle: "View your past workouts", iconName: "calendar.badge.minus", destination: AnyView(Text("Test")))
                    // TODO: replace AnyView with history view
                    // TODO: replace icon to not clash with Today view
                    
                    CardView(title: "Create Workout", subtitle: "Create a new workout for today or the future", iconName: "plus.circle", destination: AnyView(Text("Test")))
                    // TODO: replace AnyView with add view
                    
                    CardView(title: "Statistics", subtitle: "View your progress over time", iconName: "chart.line.uptrend.xyaxis", destination: AnyView(Text("Test")))
                    // TODO: replace AnyView with Stats view

                    // TODO: Implement Favorite exercise functionality?
                    // TODO: add Favorites functionality to WorkoutExercise
                }
            }
            .navigationTitle("StackUp")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingProfile = true
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .imageScale(.large)
                    }
                    .accessibilityLabel(Text("User Profile"))
                }
            }
            .sheet(isPresented: $showingProfile) {
                if let profile = try? modelContext.fetch(FetchDescriptor<UserProfile>()).first {
                    UserProfileView(profile: profile)
                } else {
                    Text("No Profile Found")
                    //TODO: Add an option to add a profile, with a button leading to the profile setup pipeline
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
