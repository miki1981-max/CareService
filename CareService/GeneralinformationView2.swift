//
//  GeneralinformationView2.swift
//  CareService
//
//  Created by Kamila Ponomarova on 2025-05-22.
//



import SwiftUI

struct GeneralinformationIView2: View {
    
    @State var firebase =  Firebasecode()
    @State var navigateToSurvey12 = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("This App is about")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom,10)
                
                Button(action: {
                    firebase.userLogout()
                }) {
                    Text("Sign Out")
                }
                
                Text("You and Me")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.background)
                    .font(.largeTitle)
                    .italic()
                    .foregroundColor(.blue)
                
                Text("This app is an efficient assistant in caring for elderly or sick persons. After the registration step, you need to complete a survey that consists of 4 questions. Your answers will help the app in making an appropriate care plan you can use in the future. Besides, the app includes such features as a symptom diary and a library. All recommendations and articles are written by experts.")
                    .font(.body)
                    
                    .navigationBarTitle("General information",
                                        displayMode:.inline)
                
                Button(action: {
                    navigateToSurvey12 = true
                }) {
                    Text("Next")
                        .frame(width: 100, height: 50)
                        .foregroundStyle(Color.blue)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding()
                }
                .navigationDestination(isPresented: $navigateToSurvey12) {
                    Survey12()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.background)
                
            }
        }
    }
}

#Preview {
    GeneralinformationIView2()
}
