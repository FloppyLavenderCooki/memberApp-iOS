//
//  BookContextView.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 28/03/2025.
//

import SwiftUI

struct BookContextView: View {
    @StateObject var bookModel: BookModel = BookModel()
    
    let bks: [Book]
    
    @State var book: libraryBook
    
    var issued = 2
    // 0 - issued, 1 - reserved, 2 - available
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: book.imageLink)) { phase in
                    switch phase {
                    case .empty:
                        Image(.noCover)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 225)
                            .padding()
                        
                    case .success(let image):
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 225)
                            .padding()
                        
                    case .failure:
                        Image(.noCover)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 225)
                            .padding()
                        
                    @unknown default:
                        Image(.noCover)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 225)
                            .padding()
                    }
                }
                Text(book.title)
                    .font(.largeTitle)
                    .padding()
                HStack {
                    Text(book.author)
                        .padding()
                    Spacer()
                    Text(book.id)
                        .font(.caption)
                        .padding()
                }
                
                bookStatus(book, books: bks)
                
                Text(book.description)
                    .padding()
            }
        }
    }
}

func bookStatus(_ book: libraryBook, books: [Book]) -> Text {
    for bk in books {
        if bk.id == book.id {
            return Text("Due: \(bk.due)").foregroundColor(.blue)
        }
        
        if book.issued.isEmpty || book.issued == "" {
            return Text("Available!").foregroundColor(.green)
        }
        
    }
    
    return Text("Taken or Unavailable").foregroundColor(.red)
}

#Preview {
    BookContextView(bks: [], book: libraryBook(id: "000"))
}
