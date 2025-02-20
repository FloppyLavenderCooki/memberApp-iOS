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
                Color(hue: 0.6, saturation: 1, brightness: 0.5).edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image(systemName: "person.text.rectangle.fill")
                        .resizable()
                        .frame(width: 100, height: 75)
                        .foregroundStyle(Color(hue: 0.6, saturation: 0.5, brightness: 1))
                    
                    Text("Welcome")
                        .font(.system(size: 36, weight: .bold))
                        .colorInvert()
                    
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
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .background(.green)
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
                }
                .padding()
            }
        }
    }
}

#Preview {
    SetupView()
}
