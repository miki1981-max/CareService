//
//  RegistrationView.swift
//  CareService
//
//  Created by Kamila Ponomarova on 2025-05-22.
//



import SwiftUI

struct EcureTextField: View{
    
    @State  private var isSecureField: Bool = true
    @Binding var text: String
    var body: some View {
        HStack {
            if isSecureField {
                SecureField("Password",text: $text)
            }else {
                TextField(text, text: $text)
            }
        }.overlay(alignment:.trailing){
            Image(systemName: isSecureField ? "eye.slash": "eye")
                .onTapGesture {
                    isSecureField.toggle()
                }
        }
    }
    

    
}

struct RegistrationView: View {
    @State private var name = ""

    @State private var contacts = ""
    @State private var password = ""
    @State var navigateToGeneralInfo = false
    
    @State var firebase =  Firebasecode()

    var body: some View {
        VStack {
            Text("Registration form")
                .font(.title)
                .padding(.bottom,100)
                
            TextField("", text:$name, prompt: Text("Enter your name and last name")
                .foregroundColor(Color.gray))
                .padding(.horizontal,30)
                .lineSpacing(10)
                

            TextField("", text:$contacts, prompt: Text("Enter  e mail")
                
                .foregroundColor(Color.gray))
                .padding(.horizontal,30)
                .lineSpacing(10)
            
            SecureTextField(text:$password)
            .padding(.horizontal,30)
           
                
                .navigationBarTitle("Profile",
                    displayMode:.inline)
           
            if firebase.loginerror != nil {
                Text(firebase.loginerror!)
            }
            
            
        
        
        
        
                Button(action:{
                    firebase.userRegister(email: contacts, password: password, name: name)
                    navigateToGeneralInfo = true
                }) {
                    Text("Sign up")
                        
                        .foregroundColor(Color.blue)
                        .frame(width: 100.0, height:50)
                        .background(Color.white)
                        .cornerRadius(15)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.background)

                .navigationDestination( isPresented:$navigateToGeneralInfo) {
                    ContentView()
            }

        }
        
    }
}

#Preview {
    RegistrationView()
}
