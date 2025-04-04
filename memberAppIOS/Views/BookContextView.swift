//
//  BookContextView.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 28/03/2025.
//

import SwiftUI

struct BookContextView: View {
    @StateObject var bookModel: BookModel = BookModel()
    @StateObject var imageCacheController = ImageCacheController()
    
    let bks: [Book]
    
    @State var book: libraryBook
    
    var issued = 2
    // 0 - issued, 1 - reserved, 2 - available
    
    var body: some View {
        ScrollView {
            VStack {
                let image = imageCacheController.loadImage(for: book.imageLink, placeholder: Image(.noCover))

                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 225)
                
                Text(book.title)
                    .font(Font.custom("Rubik", size: 35, relativeTo: .largeTitle))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding()
                HStack {
                    Text(book.author)
                        .font(Font.custom("Inter", size: 15, relativeTo: .subheadline))
                        .padding()
                    Spacer()
                    Text(book.id)
                        .font(Font.custom("Inter", size: 15, relativeTo: .subheadline))
                        .padding()
                }
                
                bookStatus(book, books: bks)
                
                Text(book.description)
                    .font(Font.custom("Inter", size: 12.5))
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
