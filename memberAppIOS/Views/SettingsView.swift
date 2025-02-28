//
//  SettingsView.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 15/02/2025.
//
// Manage account and any app settings

import SwiftUI


struct SettingsView: View {
    var body: some View {
        VStack {
            Image(systemName: "gear")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("log out or change details")
        }
        .padding()
    }
}

#Preview {
    SettingsView()
        .environmentObject(SetupState())
}
