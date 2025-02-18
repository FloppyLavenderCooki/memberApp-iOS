//
//  GetUserData.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 18/02/2025.
//

import FirebaseCore
import FirebaseAuth
import FirebaseFirestore


func getUsers() async {
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
            
            
            
        }
    }
    
}

func getUserNoCard(_ cardSN: String) -> String {
    
    return ""
}

func getUserFromID(_ id: String) -> String {
    
    return ""
}
