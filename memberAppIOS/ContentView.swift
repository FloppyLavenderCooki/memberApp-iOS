//
//  ContentView.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 15/02/2025.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userDataModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hue: 0.6, saturation: 0.25, brightness: 1).edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("view member information and manage")
                    
                    List(userDataModel.userData) { item in
                        Text(item.name)
                    }
                    .listStyle(.plain)
                    .background(Color(hue: 0.6, saturation: 0.25, brightness: 1))
                    .clipped()
                    .font(Font.custom("Rubik", size: 30))
                }
                .padding()
            }
        }
    }
    
    init() {
        userDataModel.getData()
    }
    
}

#Preview {
    ContentView()
}
