//
//  UserBooksView.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 27/02/2025.
//
// View issued and reserved books

import SwiftUI

struct IssuedView: View {
    @StateObject var bookModel: BookModel = BookModel()
    @StateObject var imageCacheController = ImageCacheController()
    
    @State private var searchText: String = ""

    let books: [Book]

    var filteredBooks: [Book] {
        if searchText.isEmpty {
            return books
        } else {
            return books.filter { book in
                if let catBook = bookDataList.first(where: { $0.id == book.id }) {
                    return catBook.title.localizedCaseInsensitiveContains(searchText) ||
                           catBook.author.localizedCaseInsensitiveContains(searchText)
                }
                return false
            }
        }
    }

    var body: some View {
        VStack {
            TextField("Search books or authors...", text: $searchText)
                .padding(8)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            if filteredBooks.isEmpty {
                Text("No books found :(")
                    .font(Font.custom("Rubik", size: 50, relativeTo: .largeTitle))
                    .foregroundColor(.black)
                    .padding()
            } else {
                List(filteredBooks) { book in
                    if let catBook = bookDataList.first(where: { $0.id == book.id }) {
                        NavigationLink(destination:
                                        BookContextView(bks: books, book: catBook)
                        ) {
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
                                    Text("Due: \(book.due)")
                                        .font(Font.custom("Inter", size: 15, relativeTo: .caption))
                                        .foregroundColor(.yellow)
                                }
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
    IssuedView(books: [])
}
