//
//  UserProfileView.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/6/25.
//

import SwiftUI

struct UserProfileView: View {
    @Bindable var profile: UserProfile
    
    
    var body: some View {
        VStack {
            TextField("Name", text: $profile.name)
                .padding(.horizontal)
            HStack{
                Text("Tap to edit")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Spacer()
            }
            .padding(.horizontal)
            HStack {
                DatePicker(selection: $profile.DOB,
                           displayedComponents: [.date],
                           label: { Text("Date of Birth")
                    Text(profile.age == 1 ? "\(profile.age) year old" : "\(profile.age) years old")
                })
                .padding()
            }
            
            HStack {
                Text("Current Weight")
                    .padding(.horizontal)
                Spacer()
                Text(profile.weightUnits == WeightUnits.pounds ? "\(Int(profile.weight)) lbs" : "\(profile.weight, specifier: "%.1f") kg")
                    .padding(.horizontal)
            }
            Text("To change your weight, add a new entry in the Body Weight section.")
                .font(.caption)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
            
            Text("Height PlaceHolder") //TODO: Change UserProfileView placeholder for Height field
                .padding()
            
            HStack {
                Text("Current Goal")
                    .padding(.horizontal)
                Spacer()
                Picker(selection: $profile.goalOverall, label: Text("Current Goal")) {
                    Text("Open").tag(WorkoutGoal.open)
                    Text("Lose Weight").tag(WorkoutGoal.loseWeight)
                    Text("Gain Weight").tag(WorkoutGoal.gainWeight)
                    Text("Walk more Steps").tag(WorkoutGoal.moreStepsTotal)
                    Text("Walk more Distance").tag(WorkoutGoal.moreDistanceTotal)
                    Text("More Workout Distance").tag(WorkoutGoal.moreDistanceCardio)
                    Text("Longer Cardio Workout").tag(WorkoutGoal.moreDurationCardio)
                    Text("Better Cardio Interval").tag(WorkoutGoal.betterIntervalCardio)
                    Text("More Reps Lifting").tag(WorkoutGoal.moreRepsStrength)
                    Text("More Sets Lifting").tag(WorkoutGoal.moreSetsStrength)
                    Text("More Weight Lifting").tag(WorkoutGoal.moreWeightStrength)
                    
                }
            }
            
            Toggle("Notifications", isOn: $profile.notificationsEnabled)
                .padding()
        }
    }
}

#Preview {
    UserProfileView(profile: UserProfile.init(name: "Jane Doe", DOB: Date(timeIntervalSinceNow: -999999999), gender: Gender.female, weight: 120, weightUnits: WeightUnits.kilograms, goalOverall: WorkoutGoal.open, notificationsEnabled: true, lastUpdatedGoal: Date()))
}
