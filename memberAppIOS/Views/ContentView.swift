//
//  ContentView.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 15/02/2025.
//

import SwiftUI

var displayUser: libraryUser = libraryUser(id: "nil", name: "error")

var firstNameText: String = "User"
var welcomeText: String = "Welcome"
var subtitleText: String = "Back already?"

struct ContentView: View {
    @EnvironmentObject var setupState: SetupState
    @StateObject private var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(welcomeText) \(firstNameText)!")
                    .font(Font.custom("Rubik", size: 50, relativeTo: .largeTitle))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.black)
                    .padding(.top)
                
                Text(subtitleText)
                    .font(Font.custom("Inter", size: 30, relativeTo: .subheadline))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                Button("DEBUG RESET DATA") {
                    setupState.setupComplete = false
                    UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
                }
                .padding()
            }
            .padding()
        }
        .safeAreaInset(edge: .top) {
            Color.cbBlue
                .frame(height: 75)
                .ignoresSafeArea()
                .shadow(color: .black, radius: 5)
        }
        .onAppear {
            viewModel.getData(setupState)
            makeDisplayText()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(SetupState())
}
