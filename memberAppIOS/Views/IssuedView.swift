//
//  UserBooksView.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 27/02/2025.
//
// View issued and reserved books

import SwiftUI

struct IssuedView: View {
    let books: [Book]
    
    var body: some View {
        NavigationView {
            List(books) { book in
                Text(book.id)
            }
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    IssuedView(books: [Book(id: "", due: "")])
}
