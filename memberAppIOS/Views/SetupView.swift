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
                        .font(Font.custom("Rubik", size: 36, relativeTo: .title))
                        .bold()
                        .foregroundStyle(.textColour)
                    
                    Button(action: {
                        // scan nfc card. for now, we will skip this and pass ID 0 to ContentView
                        if !NFCReaderSession.readingAvailable {
                            canNotNFC = true
                        } else {
                            @StateObject var nfcReader = NFCReader()
                            nfcReader.startScanning()
                        }
                        
                        // scanning code here, functions in NFCReader.swift
                        
                    }) {
                        Text("Scan Member Card")
                            .frame(maxWidth: .infinity)
                            .font(Font.custom("Inter", size: 20))
                            .bold()
                            .foregroundColor(.textColour)
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
