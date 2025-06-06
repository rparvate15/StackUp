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
                // Here is where to put the cards
                Text("Hello World!")
                Image(systemName: "globe")
            }
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
