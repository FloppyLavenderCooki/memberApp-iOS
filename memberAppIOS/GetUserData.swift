//
//  GetUserData.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 18/02/2025.
//

import FirebaseCore
import FirebaseAuth
import FirebaseFirestore


var usersData: [String : Any] = [:]

func getUsers() async {
    print("getting users")
    
    Auth.auth().signInAnonymously { (authResult, err) in
        if let err = err {
            print("Auth error: \(err)")
        } else {
            guard let user = authResult?.user else { return }
            let isAnonymous = user.isAnonymous  // true
            let uid = user.uid
        }
    }
    
    let db = Firestore.firestore()
    
    db.collection("Users").getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            var dData: [String : Any] = [:]
            
            for document in querySnapshot!.documents {
                let key = document.documentID
                let value = document.data()
                dData[key] = value
            }
            usersData = dData
        }
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
