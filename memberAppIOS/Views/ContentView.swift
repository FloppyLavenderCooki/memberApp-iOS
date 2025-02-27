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

var expValue: Float = 69
var expReq: Float = 100
var levelText: Int = 3

struct ContentView: View {
    @EnvironmentObject var setupState: SetupState
    @StateObject private var viewModel: ViewModel = ViewModel()
    
    @State private var expText = expValue / expReq
    
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
                
                HStack {
                    Image(.cardFront)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 100)
                                        
                    VStack(alignment: .leading) {
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("ID: \(displayUser.id)")
                                .font(Font.custom("Inter", size: 21, relativeTo: .caption))
                                .multilineTextAlignment(.leading)
                                .fontWeight(.heavy)
                                .padding(.top)
                            
                            Text(displayUser.cardSN)
                                .font(Font.custom("Inter", size: 16, relativeTo: .caption))
                                .multilineTextAlignment(.leading)
                                .fontWeight(.bold)
                        }
                        Spacer()
                        Text("Expires: \(displayUser.expiry)")
                            .font(Font.custom("Inter", size: 15, relativeTo: .caption))
                            .multilineTextAlignment(.leading)
                            .padding(.bottom)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 159)
                    
                    
                }
                .background(Color(hue: 0.55, saturation: 0.15, brightness: 1))
                .cornerRadius(6)
                
                HStack {
                    VStack(alignment: .leading) {
                        ProgressView(value: expText)
                        Text("\(Int(expValue))/\(Int(expReq)) XP")
                            .font(Font.custom("Inter", size: 20, relativeTo: .caption))
                            .fontWeight(.bold)
                    }
                    VStack {
                        Text("\(levelText)")
                            .font(Font.custom("Rubik", size: 50))
                            .fontWeight(.heavy)
                            .font(.system(size: 500))
                            .minimumScaleFactor(0.01)
                    }
                }
                
                
                
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
