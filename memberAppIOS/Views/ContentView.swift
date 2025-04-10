//
//  ContentView.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 15/02/2025.
//
// Main View

import SwiftUI

var displayUser: libraryUser = libraryUser(id: "nil", exp: 70, name: "error")

var firstNameText: String = "User"
var welcomeText: String = "Welcome"
var subtitleText: String = "Back already?"
var suffixText: String = "!"

struct ContentView: View {
    @EnvironmentObject var setupState: SetupState
    @StateObject private var viewModel: ViewModel = ViewModel()
    @StateObject private var bookModel: BookModel = BookModel()
    
    @State var expReqText: Float = Float(getExpRequirement(displayUser))

    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    
                    Image(systemName: "book.pages.fill")
                        .imageScale(.large)
                        .foregroundStyle(.accent)
                    
                    Text("\(welcomeText), \(firstNameText)\(suffixText)")
                        .font(Font.custom("Rubik", size: 50, relativeTo: .largeTitle))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.black)
                        .padding(.top)
                    
                    Text(subtitleText)
                        .font(Font.custom("Inter", size: 30, relativeTo: .subheadline))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                    
                    HStack {
                        Image(.cardFront)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100)
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("ID: \(displayUser.id)")
                                    .font(Font.custom("Inter", size: 21, relativeTo: .caption))
                                    .multilineTextAlignment(.leading)
                                    .fontWeight(.heavy)
                                    .padding(.top)
                                
                                Text(displayUser.cardSN)
                                    .font(Font.custom("Inter", size: 16, relativeTo: .caption))
                                    .multilineTextAlignment(.leading)
                                    .fontWeight(.bold)
                            }
                            Spacer()
                            Text("Expires: \(displayUser.expiry)")
                                .font(Font.custom("Inter", size: 15, relativeTo: .caption))
                                .multilineTextAlignment(.leading)
                                .padding(.bottom)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 159)
                        
                        
                    }
                    .background(Color(hue: 0.55, saturation: 0.15, brightness: 1))
                    .cornerRadius(6)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            ProgressBarView(progress: CGFloat(Float(displayUser.exp) / abs(expReqText)))
                                .frame(maxWidth: 250)
                            Text("\(Int(displayUser.exp))/\(Int(expReqText)) XP")
                                .font(Font.custom("Inter", size: 20, relativeTo: .caption))
                                .fontWeight(.bold)
                        }
                        Spacer()
                        Text("\(getLevel(displayUser))")
                            .font(Font.custom("Rubik", size: 75))
                            .fontWeight(.heavy)
                            .foregroundStyle(.cbBlue)
                    }
                    .frame(maxHeight: 50)
                    .padding(.bottom)
                    
                    NavigationLink(destination: IssuedView(books: bookStringToData(displayUser.books) ?? [Book(id: "", due: "")])) {
                        HStack {
                            Text("Issued Books")
                                .font(Font.custom("Inter", size: 25))
                                .foregroundStyle(.cbBlue)
                                .fontWeight(.medium)
                                .padding()
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 10, height: 20)
                                .padding()
                        }
                        .frame(maxWidth: .infinity, maxHeight: 20)
                    }
                    .padding()
                    .background(Color(hue: 0.55, saturation: 0.15, brightness: 1))
                    .clipShape(
                        .rect(
                            topLeadingRadius: 20,
                            bottomLeadingRadius: 0,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 20
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.cbBlue, lineWidth: 7.5)
                    )
                    
                    NavigationLink(destination: CatalogView(books: bookStringToData(displayUser.books) ?? [Book(id: "", due: "")])) {
                        HStack {
                            Text("Catalog")
                                .font(Font.custom("Inter", size: 25))
                                .foregroundStyle(.cbBlue)
                                .fontWeight(.medium)
                                .padding()
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 10, height: 20)
                                .padding()
                        }
                        .frame(maxWidth: .infinity, maxHeight: 20)
                    }
                    .padding()
                    .background(Color(hue: 0.55, saturation: 0.15, brightness: 1))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.cbBlue, lineWidth: 7.5)
                    )
                    NavigationLink(destination: SettingsView()) {
                        HStack {
                            Text("Settings")
                                .font(Font.custom("Inter", size: 25))
                                .foregroundStyle(.cbBlue)
                                .fontWeight(.medium)
                                .padding()
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 10, height: 20)
                                .padding()
                        }
                        .frame(maxWidth: .infinity, maxHeight: 20)
                    }
                    .padding()
                    .background(Color(hue: 0.55, saturation: 0.15, brightness: 1))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.cbBlue, lineWidth: 7.5)
                    )
                    
                    Spacer()
                    
                    Button(action: {
                        setupState.setupComplete = false
                        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
                    }) {
                        Text("DEBUG RESET DATA")
                            .frame(maxWidth: .infinity)
                            .font(Font.custom("Inter", size: 15, relativeTo: .caption))
                            .foregroundStyle(.textColour)
                            .fontWeight(.heavy)
                            .padding()
                            .background(Color.red.opacity(0.5))
                            .cornerRadius(20)
                    }
                    
                }
                .padding()
            }
            .preferredColorScheme(.light)
            .safeAreaInset(edge: .top) {
                Color.cbBlue
                    .frame(height: 75)
                    .ignoresSafeArea()
                    .shadow(color: .black, radius: 5)
            }
        }
        .onAppear {
            viewModel.getData(setupState)
            bookModel.getData(setupState)
            makeDisplayText()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(SetupState())
}
