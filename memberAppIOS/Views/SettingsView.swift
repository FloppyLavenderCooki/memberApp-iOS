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
                HStack {
                    Image(systemName: "book.and.wrench.fill")
                        .imageScale(.large)
                        .foregroundStyle(.accent)
                    
                    Text("Settings")
                        .font(Font.custom("Rubik", size: 30, relativeTo: .title))
                }
                Spacer()
                
                // textfield to change name
                // textfield to change password
                // textfield to change city
                
                Text("V0.9.1")
                Text("Group Two Libraries")
                
                Spacer()
                
                Button(action: {
                    setupState.setupComplete = false
                    UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
                }) {
                    Text("Log Out")
                        .frame(maxWidth: .infinity)
                        .font(Font.custom("Inter", size: 15, relativeTo: .caption))
                        .foregroundStyle(.textColour)
                        .fontWeight(.heavy)
                        .padding()
                        .background(Color.cbBlue.opacity(0.5))
                        .cornerRadius(20)
                }
                
                Spacer()
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
