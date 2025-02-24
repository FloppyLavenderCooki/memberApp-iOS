//
//  SetupView.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 15/02/2025.
//
import SwiftUI
import CoreNFC

struct SetupView: View {
    @State var canNotNFC = false
    @State var manualID = false
    @State var userID: String = ""

    var body: some View {
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
                            .font(Font.custom("Inter", size: 25, relativeTo: .caption))
                            .foregroundColor(.textColour)
                            .frame(maxWidth: .infinity)
                            .colorInvert()
                            .padding()
                            .background(.cGreen)
                            .cornerRadius(20)
                    }
                    .alert("Your device does not support NFC!", isPresented: $canNotNFC) {
                        TextField("G2-XXXXXXXX", text: $userID)
                            .keyboardType(.decimalPad)
                        Button("OK") {
                            getUserData(userID, "TYPE")
                        }
                        Button("Cancel", role: .cancel) {}
                        
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

#Preview {
    SetupView()
}
