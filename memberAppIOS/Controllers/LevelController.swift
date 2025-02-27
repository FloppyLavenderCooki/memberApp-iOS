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

func getExpRequirement(_ user: libraryUser) -> Int {
    let userXP = user.exp
    
    for i in levelsExp.sorted() {
        if i > abs(userXP) {
            if userXP < 0 {
                return -i
            }
            return i
        }
    }
    return 0
}






