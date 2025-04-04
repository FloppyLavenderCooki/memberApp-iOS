//
//  CatalogView.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 27/02/2025.
//
// View books in library catalog

import SwiftUI

struct CatalogView: View {
    @StateObject var bookModel: BookModel = BookModel()
    @StateObject var imageCacheController = ImageCacheController()
    
    @State private var searchText: String = ""

    var books: [Book]

    var filteredBooks: [libraryBook] {
        if searchText.isEmpty {
            return bookDataList
        } else {
            return bookDataList.filter { catBook in
                catBook.title.localizedCaseInsensitiveContains(searchText) ||
                catBook.author.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        VStack {
            TextField("Search books or authors...", text: $searchText)
                .padding(8)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            List(filteredBooks) { catBook in
                NavigationLink(destination: BookContextView(bks: books, book: catBook)) {
                    HStack {
                        let image = imageCacheController.loadImage(for: catBook.imageLink, placeholder: Image(.noCover))
                        
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 150)

                        VStack(alignment: .leading) {
                            Text(catBook.title)
                                .font(Font.custom("Rubik", size: 20, relativeTo: .largeTitle))
                                .fontWeight(.bold)
                            HStack {
                                Text(catBook.author)
                                    .font(Font.custom("Inter", size: 15, relativeTo: .subheadline))
                                Spacer()
                                Text("ID: \(catBook.id)")
                                    .font(Font.custom("Inter", size: 15, relativeTo: .subheadline))
                            }
                        }
                    }
                }
            }
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    CatalogView(books: [Book(id: "", due: "")])
}

