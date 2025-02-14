//
//  SetupView.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 15/02/2025.
//
import SwiftUI

struct SetupView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.text.rectangle.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Add member card and get details")
        }
        .padding()
    }
}

#Preview {
    SetupView()
}
