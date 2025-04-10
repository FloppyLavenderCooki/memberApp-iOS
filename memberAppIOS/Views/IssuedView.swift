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
            HStack {
                Image(systemName: "bookmark.square.fill")
                    .imageScale(.large)
                    .foregroundStyle(.accent)
                
                Text("Issued Books")
                    .font(Font.custom("Rubik", size: 30, relativeTo: .title))
            }
            
            TextField("Search books or authors...", text: $searchText)
                .padding(8)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            if filteredBooks.isEmpty {
                ZStack {
                    Color(.background)
                        .ignoresSafeArea()
                    VStack {
                        Spacer()
                        Text("No books found :(")
                            .font(Font.custom("Rubik", size: 30, relativeTo: .title))
                            .bold()
                            .foregroundColor(.black)
                            .padding()
                        Spacer()
                    }
                }
            } else {
                List(filteredBooks) { book in
                    if let catBook = bookDataList.first(where: { $0.id == book.id }) {
                        NavigationLink(destination:
                                        BookContextView(bks: books, book: catBook)
                        ) {
                            HStack {
                                AsyncImage(url: URL(string: catBook.imageLink)) { phase in
                                    switch phase {
                                    case .empty:
                                        Image(.noCover)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 150)

                                    case .success(let image):
                                        image.resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 150)

                                    case .failure:
                                        Image(.noCover)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 150)

                                    @unknown default:
                                        Image(.noCover)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 150)
                                    }
                                }

                                VStack(alignment: .leading) {
                                    Text(catBook.title)
                                        .font(.headline)
                                    HStack {
                                        Text(catBook.author)
                                            .font(.subheadline)

                                        Spacer()

                                        Text("ID: \(catBook.id)")
                                            .font(.subheadline)
                                    }
                                    Text("Due: \(book.due)")
                                        .font(.caption)
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
