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
    var body: some View {
        VStack {
            List(bookDataList) { catBook in
                NavigationLink(destination:
                    BookContextView(book: catBook)
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
                        }
                    }
                }
            }
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    CatalogView()
}
