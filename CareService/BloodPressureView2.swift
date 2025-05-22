//
//  BloodPressureView2.swift
//  CareService
//
//  Created by Kamila Ponomarova on 2025-05-22.
//

//
//  

import SwiftUI

struct BloodPressureView2: View {
    // Get these from Fillinginformation4
    //var pressure: String
    var systolic: String
    var diastoloe: String
    @State var BloodPressureResult = ""
    @State private var showConfirmation = false
    
    @State private var measurementPlace: String = "Arm" // Default place
    @State private var noteworthyMeasure: String = "" // Default is none of the options
    @State private var currentTime: String = "" // To hold real-time
    @State private var notice: String = "" // Notice input

    var body: some View {
        VStack(spacing: 20) {
            Text("List of symptoms")
                .font(.largeTitle)
                .bold()
                .padding(.top, 50)

            Text("Blood pressure is...")
                .font(.title3)
                .padding(.bottom, 10)
                .onAppear() {
                    BloodPressureResult = "\(systolic) / \(diastoloe)"
                }
            
            Text(BloodPressureResult)
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
            
            /* Text("The place of blood pressure measurement")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
            */
            VStack(alignment: .leading, spacing: 10) {
                ForEach(["Body position", "Arm", "Irregular pulse"], id: \.self) { notable in
                    Button(action: {
                        noteworthyMeasure = notable
                    }) {
                        HStack {
                            Image(systemName: noteworthyMeasure == notable ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(noteworthyMeasure == notable ? .blue : .gray)
                            Text(notable)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }

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
        UserDefaults.standard.set(BloodPressureResult, forKey: "savedBloodPressure")
        UserDefaults.standard.set(notice, forKey: "savedNotice")
    }
}

struct BloodPressureView2_Previews: PreviewProvider {
    static var previews: some View {
        BloodPressureView2(systolic: "90", diastoloe: "60") // Pass example value for preview
    }
}
