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
                HStack {
                    Image(.noCover)
                        .resizable()
                        .frame(width: 100, height: 150)
                        .scaledToFit()
                    
                    Text(book.id)
                }
            }
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    IssuedView(books: [Book(id: "", due: "")])
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                } else {
                    self?.image = UIImage(resource: .noCover)
                }
            }
        }
    }
}
