//
//  SettingsView.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 15/02/2025.
//
// Manage account and any app settings

import SwiftUI


struct SettingsView: View {
    @EnvironmentObject var setupState: SetupState
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "book.and.wrench.fill")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("log out or change details")
                
                Button(action: {
                    setupState.setupComplete = false
                    UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
                }) {
                    Text("DEBUG RESET DATA")
                        .frame(maxWidth: .infinity)
                        .font(Font.custom("Inter", size: 15, relativeTo: .caption))
                        .foregroundStyle(.textColour)
                        .fontWeight(.heavy)
                        .padding()
                        .background(Color.red.opacity(0.5))
                        .cornerRadius(20)
                }
            }
            .padding()
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    SettingsView()
        .environmentObject(SetupState())
}
