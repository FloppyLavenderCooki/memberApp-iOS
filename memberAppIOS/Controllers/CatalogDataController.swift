//
//  CatalogDataController.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 27/02/2025.
//
// Get library 🐱🅰️🪵

import Combine
import Foundation
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

struct libraryBook: Identifiable {
    var id: String
    
    var author: String = ""
    var description: String = ""
    var imageLink: String = ""
    var issued: String = ""
    var title: String = ""
}

var bookDataList: [libraryBook] = []

class BookModel: ObservableObject {
    @Published var bookData = [libraryBook]()
    
    func getData(_ setupState: SetupState) {
        let db = Firestore.firestore()
        db.collection("Books").getDocuments { (snapshot, error) in
            if error == nil {
                if let snapshot = snapshot {
                    self.bookData = snapshot.documents.map { document in
                        let bookFound =  libraryBook(id: document.documentID, author: document["Author"] as? String ?? "", description: document["Description"] as? String ?? "", imageLink: document["ImageLink"] as? String ?? "", issued: document["Issued"] as? String ?? "", title: document["Title"] as? String ?? "")
                        
                        return bookFound
                    }
                }
                
                bookDataList = self.bookData
            }
        }
    }
}



