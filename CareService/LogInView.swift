//
//  LogInView.swift
//  CareService
//
//  Created by Kamila Ponomarova on 2025-05-22.
//


import SwiftUI
import FirebaseAuth

struct SecureTextField: View {
    @State private var isSecureField: Bool = true
    @Binding var text: String
    
    var body: some View {
        HStack {
            if isSecureField {
                SecureField("Password", text: $text)
                    .padding()
            } else {
                TextField("Password", text: $text)
                    .padding()
            }
            
            // Toggle visibility icon
            Button(action: {
                isSecureField.toggle()
            }) {
                Image(systemName: isSecureField ? "eye.slash" : "eye")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
    }
}

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var showError = false
    
    @State var firebase = Firebasecode()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    // Title
                    Text("Please, log in")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    
                    TextField("Enter your e-mail", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal, 30)
                        
                        .navigationBarTitle("Profile",
                                            displayMode:.inline)
                
                    SecureTextField(text: $password)
                        .padding(.horizontal, 30)
                    
                    // Show error message if login fails
                    if showError, let error = firebase.loginerror {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.subheadline)
                            .padding(.horizontal, 30)
                    }
                    
                    // Log In Button
                    Button(action: {
                        firebase.userLogin(email: email, password: password)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Simulate login delay
                            if firebase.loginerror == nil {
                                isLoggedIn = true
                            } else {
                                showError = true
                            }
                        }
                    }) {
                        Text("Log in")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 30)
                    }
                    
                    Spacer()
                    
                    // Navigation to next screen
                    NavigationLink("", destination: RecommendationsView1(), isActive: $isLoggedIn)
                        .hidden()
                }
                .padding(.top, 50)
                .background(Color.background)
            }
        }
    }
}

// Preview
#Preview {
    LoginView()
}
