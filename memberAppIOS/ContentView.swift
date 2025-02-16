//
//  ContentView.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 15/02/2025.
//

import SwiftUI

var memberID: String = ""

func GetMemberID(_ ID: String) -> String {
    memberID = ID
    
    print("memberID: \(memberID)")
    
    @Environment(\.openWindow) var openWindow
    openWindow(id: "Content")
    
    return memberID
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(hue: 0.6, saturation: 0.25, brightness: 1).edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("view member information and manage")
                    Text(memberID)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
