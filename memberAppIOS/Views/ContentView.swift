//
//  ContentView.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 15/02/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var setupState: SetupState
    @StateObject private var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hue: 0.6, saturation: 0.25, brightness: 1).edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("view member information and manage")
                    
                    List(dataList) { item in
                        Text(item.id)
                    }
                    .listStyle(.plain)
                    .background(Color(hue: 0.6, saturation: 0.25, brightness: 1))
                    .clipped()
                    .font(Font.custom("Rubik", size: 30))
                    
                    Button("DEBUG RESET DATA") {
                        setupState.setupComplete = false
                        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.getData(setupState)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(SetupState())
}
