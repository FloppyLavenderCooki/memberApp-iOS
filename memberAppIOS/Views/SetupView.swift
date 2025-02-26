//
//  SetupView.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 15/02/2025.
//
import SwiftUI
import CoreNFC

class SetupState: ObservableObject {
    @AppStorage("setupComplete") var setupComplete: Bool = false {
        willSet { objectWillChange.send() }
    }
    
    @AppStorage("errorOccur") var errorOccur: Bool = false {
        willSet { objectWillChange.send() }
    }
}

struct SetupView: View {
    @State var canNotNFC: Bool = false
    @State var manualID: Bool = false
    @State var userID: String = ""
    
    @EnvironmentObject var setupState: SetupState
    @StateObject private var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        if setupState.setupComplete {
            ContentView()
            
        } else {
            NavigationView {
                ZStack {
                    Color.cbBlue
                        .ignoresSafeArea()
                    
                    VStack {
                        Spacer()
                        Image(.numberTwo)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100)
                        
                        Text("Welcome")
                            .font(Font.custom("Rubik", size: 50, relativeTo: .largeTitle))
                            .bold()
                            .foregroundStyle(.textColour)
                        
                        Button(action: {
                            canNotNFC = true
                            // scan nfc card. for now, we will skip this and pass ID 0 to ContentView
                            
                            // scanning code here, functions in NFCReader.swift
                            
                        }) {
                            Text("Scan Member Card")
                                .frame(maxWidth: .infinity)
                                .font(Font.custom("Inter", size: 25, relativeTo: .caption))
                                .foregroundStyle(.textColour)
                                .fontWeight(.heavy)
                                .padding()
                                .background(Color.white.opacity(0.5))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.white, lineWidth: 7.5)
                                )
                                .cornerRadius(20)
                        }
                        .alert("Your device does not support NFC!", isPresented: $canNotNFC) {
                            TextField("G2-XXXXXXXX", text: $userID)
                                .keyboardType(.decimalPad)
                            Button("OK") {
                                getUserData(userID, "TYPE")
                                viewModel.getData(setupState)
                            }
                            Button("Cancel", role: .cancel) {}
                            
                        }
                        .alert("Couldn't find user", isPresented: $setupState.errorOccur) {
                            Button("OK", role: .cancel) { setupState.errorOccur = false }
                        }
                        
                        Spacer()
                        HStack {
                            Image(.textLogo)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 250)
                                .padding()
                            Spacer()
                        }
                    }
                    .padding()
                }
            }
        }
    }
}


#Preview {
    SetupView()
        .environmentObject(SetupState())
}
