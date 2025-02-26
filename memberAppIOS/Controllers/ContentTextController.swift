//
//  ContentTextController.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 27/02/2025.
//

import Foundation

var greetings: [String] = [
    "Hello",
    "Welcome",
    "Hi"
]

var subtitles: [String] = [
    "Back already?",
    "Let's check out another book!",
    "Take a look at some new releases.",
    "Come to the library soon!",
    "Glad to see you."
]

func makeDisplayText() {
    welcomeText = greetings.randomElement() ?? "Hello"
    subtitleText = subtitles.randomElement() ?? "Glad to see you."
    
    firstNameText = String(displayUser.name.split(separator: " ").first ?? "User")
}
