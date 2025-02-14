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
        ZStack {
            Color(hue: 0.6, saturation: 0.25, brightness: 1).edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(systemName: "person.text.rectangle.fill")
                    .resizable()
                    .frame(width: 100, height: 75)
                    .foregroundStyle(.tint)
                
                Text("Welcome")
                    .font(.system(size: 36, weight: .bold))
                
                Button(action: {
                    // scan nfc card. for now, we will skip this and pass ID 000 to ContentView
                    if !NFCReaderSession.readingAvailable {
                        canNotNFC = true
                    } else {
                        var cardResult = "000"
                        
                        GetMemberID(String(cardResult))
                    }
                }) {
                    Text("Scan Member Card")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(.green)
                        .cornerRadius(20)
                }
                .alert("Your Phone does not support NFC!", isPresented: $canNotNFC) {
                    TextField("Enter User ID", text: $userID)
                    Button("OK") {
                        GetMemberID(userID)
                    }
                    Button("Cancel", role: .cancel) {}
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    SetupView()
}
