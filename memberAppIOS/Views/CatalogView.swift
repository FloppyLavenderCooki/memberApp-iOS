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
            HStack {
                Image(systemName: "books.vertical.fill")
                    .imageScale(.large)
                    .foregroundStyle(.accent)
                
                Text("Catalog")
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
                List(filteredBooks) { catBook in
                    NavigationLink(destination: BookContextView(bks: books, book: catBook)) {
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

// 242, 242, 247
