//
//  BodyWeightView2.swift
//  CareService
//
//  Created by Kamila Ponomarova on 2025-05-22.
//



import SwiftUI

struct BodyWeightView2: View {
    var bodyweight: String // Get from Fillinginformation2
    @State private var currentTime: String = "" // To hold real-time
    @State private var notice: String = "" // Notice input
    @State private var showConfirmation = false

    var body: some View {
        VStack(spacing: 20) {
            Text("List of symptoms")
                .font(.largeTitle)
                .bold()
                .padding(.top, 50)

            Text("Body weight is...")
                .font(.title3)
                .padding(.bottom, 10)

            Text(bodyweight + " kg")
                .font(.largeTitle)
                .bold()

            HStack(spacing: 10) {
                Text(currentTime)
                    .font(.headline)
                    .padding()
                    .frame(minWidth: 100, idealWidth: 150, maxWidth: 200, maxHeight: 40)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)

                Button("TODAY") {
                    // "Today" button action
                }
                .frame(minWidth: 100, idealWidth: 150, maxWidth: 200, maxHeight: 40)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding(.vertical, 10)

            TextField("Enter notice", text: $notice)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 250)

            Button("Save") {
                saveInformation()
                showConfirmation = true
            }
            .alert(isPresented: $showConfirmation) {
                Alert(title: Text("Saved"), message: Text("Your information has been saved."), dismissButton: .default(Text("OK")))
            }
            .foregroundColor(.white)
            .frame(width: 150, height: 44)
            .background(Color.blue)
            .cornerRadius(8)
            .padding(.top, 20)

            NavigationLink(destination: Frame23View()) {
                Text("Next")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 44)
                    .background(Color.green)
                    .cornerRadius(8)
            }
            .padding(.bottom, 20)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
        .ignoresSafeArea()
        .onAppear {
            updateCurrentTime()
        }
    }

    private func updateCurrentTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        currentTime = dateFormatter.string(from: Date())
    }
    
    private func saveInformation() {
        UserDefaults.standard.set(bodyweight, forKey: "savedWeight")
        UserDefaults.standard.set(notice, forKey: "savedNotice")
    }
}

struct BodyWeightView2_Previews: PreviewProvider {
    static var previews: some View {
        BodyWeightView2(bodyweight: "57.0") // Pass example value for preview
    }
}
