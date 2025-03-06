//
//  IssuedBookController.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 01/03/2025.
//
// Get books which user has issued

import Foundation


var books: [Book]?

struct Book: Codable, Identifiable {
    let id: String
    let due: String
}

func bookStringToData(_ jsonString: String) -> [Book]? {
    // json string is a list of dictionaries containing key:value of string:string (conforms to date)
    
    let data = jsonString.data(using: .utf8)!
    
    do {
        let books = try JSONDecoder().decode([Book].self, from: data)
        return books
    } catch {
        print("JSON Decoding Error: \(error)")
        return nil
    }
}


