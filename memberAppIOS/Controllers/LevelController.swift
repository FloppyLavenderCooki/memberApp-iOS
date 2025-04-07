//
//  LevelController.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 28/02/2025.
//
// Manage level status based on exp

import Foundation


let base: Double = 100
let growth: Double = 1.5

func expForLevel(_ level: Int) -> Int {
    return Int(base * pow(growth, Double(level - 1)))
}

func getLevel(_ user: libraryUser) -> Int {
    let userXP = Double(abs(user.exp))
    var level = 1

    while Double(expForLevel(level + 1)) <= userXP {
        level += 1
    }

    return user.exp < 0 ? -level : level
}

func getExpRequirement(_ user: libraryUser) -> Int {
    let level = abs(getLevel(user)) + 1
    let exp = expForLevel(level)
    let roundedExp = Int((Double(exp) / 25.0).rounded() * 25.0)
    return user.exp < 0 ? -roundedExp : roundedExp
}
