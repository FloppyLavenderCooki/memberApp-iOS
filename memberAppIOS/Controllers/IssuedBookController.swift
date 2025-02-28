//
//  IssuedBookController.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 01/03/2025.
//
// Get books which user has issued

import Foundation

func bookStringToData(_ jsonString: String) {
    let data = jsonString.data(using: .utf8)!
    
    do {
        if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String,Any>] {
           print(jsonArray)
        } else {
            print("bad json")
        }
    } catch let error as NSError {
        print(error)
    }
}
