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
    "Hi",
    "Hey",
    "Greetings",
    "Howdy",
    "Ahoy",
    "Yo",
    "Hiya",
    "Hey there",
    "Good day",
    "Salutations",
    "What's up",
    "Welcome back",
    "Glad you're here",
    "Ahoy there",
    "Hello again",
    "Hi there",
    "Welcome in",
    "What's new",
    "Howdy partner",
    "Sup",
    "Heya",
    "G'day",
    "Well hello",
]


var subtitles: [String] = [
    "Back already?",
    "Let's check out another book!",
    "Take a look at some new releases.",
    "Come to the library soon!",
    "Glad to see you.",
    "What’s next on your reading list?",
    "Books are waiting for you!",
    "A new adventure awaits.",
    "Time to get lost in a story!",
    "Welcome back, book lover!",
    "Ready for another great read?",
    "Expand your knowledge today!",
    "Your next favorite book is here!",
    "A world of stories awaits.",
    "Let’s find you a great read.",
    "Books and more books!",
    "Discover something new today.",
    "Reading is always a good idea.",
    "Let's turn the page together.",
    "Another day, another book!",
    "What genre are you in the mood for?",
    "Pick up where you left off.",
    "It’s a great day to read!",
    "Feed your imagination!",
    "Escape into a great story.",
    "Your next adventure starts here.",
    "Never stop exploring books!",
    "Which story will you choose today?",
    "Turn the page to something new.",
    "A good book is like a good friend.",
    "Let’s build your reading list!",
    "Every book is a new journey.",
    "Find a book that speaks to you.",
    "Reading opens new worlds!",
    "Your next page-turner awaits.",
    "There’s always room for more books.",
    "Discover your next obsession.",
    "One more chapter won’t hurt!",
    "A book a day keeps boredom away!",
    "Stories bring people together.",
    "Fuel your curiosity with a book.",
    "Something amazing is waiting for you.",
    "Reading is the best escape.",
    "Book lovers unite!",
    "A cozy reading session sounds nice!",
    "Where will your next book take you?"
]


func makeDisplayText() {
    welcomeText = greetings.randomElement() ?? "Hello"
    subtitleText = subtitles.randomElement() ?? "Glad to see you."
    
    firstNameText = String(displayUser.name.split(separator: " ").first ?? "User")
}
