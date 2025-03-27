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
    
    let books: [Book]
    
    var body: some View {
        VStack {
            if books.isEmpty {
                Text("No books :(")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
            } else {
                List(books) { book in
                    if let catBook = bookDataList.first(where: { $0.id == book.id }) {
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
        .preferredColorScheme(.light)
    }
}

#Preview {
    IssuedView(books: [])
}

