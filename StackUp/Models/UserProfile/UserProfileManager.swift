//
//  UserProfileManager.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/6/25.
//

import Foundation
import SwiftData

@Observable
class UserProfileManager {
    private let modelContext: ModelContext

    init(context: ModelContext) {
        self.modelContext = context
    }
    
    // MARK: - Save User Profile
    func save(profile: UserProfile) {
        modelContext.insert(profile)
        do {
            try modelContext.save()
        } catch {
            print("Failed to save UserProfile: \(error.localizedDescription)")
        }
    }

    // MARK: - Fetch the existing User Profile
    func fetchProfile() -> UserProfile? {
        let descriptor = FetchDescriptor<UserProfile>()
        do {
            return try modelContext.fetch(descriptor).first
        } catch {
            print("Failed to fetch UserProfile: \(error.localizedDescription)")
            return nil
        }
    }

    // MARK: - Delete the current User Profile
    func deleteProfile(_ profile: UserProfile) {
        modelContext.delete(profile)
        do {
            try modelContext.save()
        } catch {
            print("Failed to delete UserProfile: \(error.localizedDescription)")
        }
    }
}
