//
//  GetUserData.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 18/02/2025.
//

import Combine
import Foundation
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

struct libraryUser: Identifiable {
    var id: String
    
    var books: [String] = []
    var overDue: [String] = []
    var cardSN: String = ""
    var city: String = ""
    var level: Int = 0
    var exp: Int = 0
    var name: String = ""
    var password: String = ""
    var expiry: String = ""
}

var getMethod: String = "TYPE"
var searchData: String = "00000000"

var foundData: libraryUser = libraryUser(id: "")
var dataList: [libraryUser] = []

func getUserData(_ sText: String, _ method: String) {
    getMethod = method
    searchData = sText
}

class ViewModel: ObservableObject {
    @Published var userData = [libraryUser]()
    
    func getData(_ setupState: SetupState) {
        let db = Firestore.firestore()
        db.collection("Users").getDocuments { (snapshot, error) in
            if error == nil {
                if let snapshot = snapshot {
                    self.userData = snapshot.documents.map { document in
                        let userFound =  libraryUser(id: document.documentID, books: document["Books"] as? [String] ?? [], overDue: document["Overdue"] as? [String] ?? [], cardSN: document["CardSN"] as? String ?? "", city: document["City"] as? String ?? "", level: document["Level"] as? Int ?? 0, exp: document["Exp"] as? Int ?? 0, name: document["Name"] as? String ?? "", password: document["Password"] as? String ?? "", expiry: document["Expiry"] as? String ?? "")
                                                
                        if getMethod == "NFC" {
                            if searchData == userFound.cardSN {
                                foundData = userFound
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
                    dataList = self.userData
                    filterData()

//                    @EnvironmentObject var setupState: SetupState
                    setupState.setupComplete = true // error
                }
            }
        }
    }
}

func filterData() {
    for i in dataList {
        if i.id == "nil" {
            dataList.removeAll { $0.id == "nil" }
        }
    }
}


