//
//  Survey12.swift
//  CareService
//
//  Created by Kamila Ponomarova on 2025-05-22.
//



import SwiftUI

struct Survey12: View {
    @State private var name: String = ""
    @State private var dateOfBirth: Date = Date()
    @State private var gender: String = ""
    @State private var showAlert = false

    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Survey")) {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("1.What is your care receiver's name?")
                        TextField("", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        Text("2.What is the care receiver's date of birth?")
                        DatePicker("", selection: $dateOfBirth, displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())

                        Text("3.Choose your gender:")
                        Picker("Gender", selection: $gender) {
                            Text("Male").tag("Male")
                            Text("Female").tag("Female")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    .padding(.vertical, 10)

                    Button("Save") {
                        saveData()
                        showAlert = true
                        
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Saved"), message: Text("Your information has been saved."), dismissButton: .default(Text("OK")))
                    }
                    .frame(maxWidth: .infinity, maxHeight: 44)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Survey3()) {
                        Text("Next")
                            .frame(maxWidth: .infinity, maxHeight: 44)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            
            .navigationBarTitle("Survey 1", displayMode: .inline)
            .background(Color("Background").ignoresSafeArea())
        }
    }
    
    private func saveData() {
        UserDefaults.standard.set(name, forKey: "SavedName")
        UserDefaults.standard.set(gender, forKey: "SavedGender")
        UserDefaults.standard.set(dateOfBirth, forKey: "SavedDOB")
    }
}

struct Survey12_Previews: PreviewProvider {
    static var previews: some View {
        Survey12()
    }
}
