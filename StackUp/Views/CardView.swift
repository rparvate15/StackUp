//
//  CardView.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/12/25.
//

import SwiftUI

struct CardView: View {
    let title: String
    let subtitle: String
    let iconName: String
    let destination: AnyView

    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Image(systemName: iconName)
                    .font(.title)
                    .foregroundColor(.accentColor)
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 120)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .shadow(radius: 3)
            .padding(.horizontal)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
#Preview {
    CardView(title: "Test 1", subtitle: "Test Sub", iconName: "calendar", destination: AnyView(Text("Test")))
}
