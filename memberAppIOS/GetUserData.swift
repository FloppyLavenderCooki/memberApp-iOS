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

struct libraryUser {
    var id: String
    
    var books: [String] = []
    var overDue: [String] = []
    var cardSN: String = ""
    var city: String = ""
    var level: Int = 0
    var exp: Int = 0
    var name: String = ""
    var password: String = ""
}

class ViewModel: ObservableObject {
    @Published var userData = [libraryUser]()
    
    func getData(_ getMethod: String, searchData: String) {
        let db = Firestore.firestore()
        db.collection("Users").getDocuments { (snapshot, error) in
            if error == nil {
                if let snapshot = snapshot {
                    self.userData = snapshot.documents.map { document in
                        let userFound =  libraryUser(id: document.documentID, books: document["Books"] as? [String] ?? [], overDue: document["Overdue"] as? [String] ?? [], cardSN: document["CardSN"] as? String ?? "", city: document["City"] as? String ?? "", level: document["Level"] as? Int ?? 0, exp: document["Exp"] as? Int ?? 0, name: document["CardSN"] as? String ?? "", password: document["Password"] as? String ?? "")
                        
                        if getMethod == "NFC" {
                            if searchData == userFound.cardSN {
                                return userFound
                            } else { return libraryUser(id: "nil") }
                        } else if getMethod == "TYPE" {
                            if "G2-\(searchData)" == userFound.id {
                                return userFound
                            } else { return libraryUser(id: "nil") }
                        } else {
                            return libraryUser(id: "nil")
                        }
                    }
                }
                
                if self.userData[0].id == "nil" {
                    print("couldn't find user")
                } else {
                    print("received data: \(self.userData)")
                    // send data
                }
            }
        }
    }
}

//func getUsers() async {
//    print("getting users")
//    
//    let db = Firestore.firestore()
//    
//    do {
//        let snapshot = try await db.collection("Users").getDocuments()
//        var dData: [String: Any] = [:]
//        
//        for document in snapshot.documents {
//            dData[document.documentID] = document.data()
//        }
//        
//        usersData = dData
//    } catch {
//        print("Error getting documents: \(error)")
//    }
//}
//
//
//func getUserNoCard(_ cardSN: String) async -> String {
//    await getUsers()
//    
//    print(cardSN)
//    return ""
//}
//
//func getUserFromID(_ id: String) async -> String {
//    await getUsers()
//    
//    print(id)
//    print(usersData)
//    return ""
//}
