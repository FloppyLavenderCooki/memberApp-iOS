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
    
    return memberID
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("view member information and manage")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
