//
//  Frame23.swift
//  CareService
//
//  Created by Kamila Ponomarova on 2025-05-22.
//



import SwiftUI

struct Frame23View: View {
    @State private var currentTime: String = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
    @State private var patient: String = UserDefaults.standard.string(forKey: "SavedName") ?? "Unknown"
    @State private var gender: String = UserDefaults.standard.string(forKey: "SavedGender") ?? "Unspecified"
    @State private var age: String = {
        let dob = UserDefaults.standard.object(forKey: "SavedDOB") as? Date ?? Date()
        let ageComponents = Calendar.current.dateComponents([.year], from: dob, to: Date())
        return "\(ageComponents.year ?? 0)"
    }()
    @State private var weight: Float = UserDefaults.standard.float(forKey: "savedWeight")
    @State private var pressure: String = UserDefaults.standard.string(forKey: "savedBloodPressure") ?? "0 / 0"
    @State private var oxygen: Int = UserDefaults.standard.integer(forKey: "savedOxygen")
    @State private var pulse: Int = UserDefaults.standard.integer(forKey: "savedPulse")
    @State private var temperature: Float = UserDefaults.standard.float(forKey: "savedBodyTemperature")
    @State private var sugarLevel: Float = UserDefaults.standard.float(forKey: "savedBloodSugarLevel")

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    HStack {
                        Text(currentTime)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: 100, maxHeight: 40)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)

                        Spacer()

                        Button("TODAY") {
                            currentTime = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
                        }
                        .frame(maxWidth: 100, maxHeight: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 20)

                    VStack(spacing: 10) {
                        entryField(label: "Name", value: patient)
                        entryField(label: "Gender", value: gender)
                        entryField(label: "Age", value: age)
                        entryField(label: "Weight", value: "\(weight) kg")
                        entryField(label: "Pressure", value: "\(pressure) mmHg")
                        entryField(label: "Oxygen", value: "\(oxygen)%")
                        entryField(label: "Pulse", value: "\(pulse) bpm")
                        entryField(label: "Body temperature", value: "\(temperature)°C")
                        entryField(label: "Sugar level", value: "\(sugarLevel) mmol/L")
                    }
                    .padding()

                    NavigationLink(destination: Fillinginformation1()) {
                        Text("Back to List of Symptoms")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 44)
                            .background(Color.green)
                            .cornerRadius(8)
                    }
                    .padding(.bottom, 20)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(Color("background"))
                .ignoresSafeArea()
            }
        }
    }

    @ViewBuilder
    private func entryField(label: String, value: String) -> some View {
        HStack {
            Text(label + ":")
                .font(.headline)
            Spacer()
            Text(value)
                .font(.subheadline)
        }
        .padding()
        .frame(height: 40)
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct Frame23View_Previews: PreviewProvider {
    static var previews: some View {
        Frame23View()
    }
}
