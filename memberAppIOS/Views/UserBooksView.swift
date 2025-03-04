//
//  UserBooksView.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 27/02/2025.
//
// View issued and reserved books

import SwiftUI

struct IssuedView: View {
    var body: some View {
        NavigationStack {
            
        }
        .onAppear() {
            bookStringToData(displayUser.books)
        }.preferredColorScheme(.light)
    }
}

#Preview {
    IssuedView()
}
