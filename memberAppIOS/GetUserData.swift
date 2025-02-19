//
//  GetUserData.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 18/02/2025.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore


var usersData: [String : Any] = [:]

struct libraryUser : Identifiable {
    var id: String
    
    var books: [String]
    var overDue: [String]
    var cardSN: String
    var city: String
    var level: Int
    var name: String
    var password: String
}

class ViewModel: ObservableObject {
    @Published var userData = [libraryUser]()
    
    func getData() {
        let db = Firestore.firestore()
        db.collection("Users").getDocuments { (snapshot, error) in
            if error == nil {
                
            }
        }
    }
    
}

func getUsers() async {
    print("getting users")
    
    let db = Firestore.firestore()
    
    do {
        let snapshot = try await db.collection("Users").getDocuments()
        var dData: [String: Any] = [:]
        
        for document in snapshot.documents {
            dData[document.documentID] = document.data()
        }
        
        usersData = dData
    } catch {
        print("Error getting documents: \(error)")
    }
}


func getUserNoCard(_ cardSN: String) async -> String {
    await getUsers()
    
    print(cardSN)
    return ""
}

func getUserFromID(_ id: String) async -> String {
    await getUsers()
    
    print(id)
    print(usersData)
    return ""
}
