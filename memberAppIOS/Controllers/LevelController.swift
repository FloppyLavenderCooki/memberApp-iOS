//
//  LevelController.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 28/02/2025.
//

import Foundation

var levelsExp: [Int] = [
    0,
    10,
    50,
    100,
    500,
    1000
]

// if l = 1, return 2 req

func getExpRequirement(_ user: libraryUser) -> Int {
    let userXP = user.exp
    
    for i in levelsExp.sorted() {
        if i > userXP {
            return i
        }
    }
    return 0
}






