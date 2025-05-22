//
//  BodyTempView1.swift
//  CareService
//
//  Created by Kamila Ponomarova on 2025-05-22.
////
//  

import SwiftUI

struct BodyTemperatureView: View {
    @State private var temperature = ""
    @State private var navigateToNextScreen = false

    var body: some View {
        NavigationView {
            ZStack {
                backgroundView
                contentStack
            }
            .navigationBarHidden(true)
        }
    }
    
    private var backgroundView: some View {
        Color("Background").ignoresSafeArea()
    }

    private var contentStack: some View {
        VStack {
            titleSection
            inputSection
            keypadSection
            nextButton
        }
    }

    private var titleSection: some View {
        VStack {
            Text("List of symptoms").font(.largeTitle).bold()
            Text("Body Temperature").font(.headline)
            Text("Please enter your or the care receiver's body temperature")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
        }.padding(.top, 20)
    }
    
    private var inputSection: some View {
        VStack {
            TextField("Enter temperature", text: $temperature)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 150)
            Text("°C").font(.headline)
        }.padding(.top, 20)
    }
    
    private var keypadSection: some View {
        VStack(spacing: 10) {
            keypadRow(keys: ["1", "2", "3"])
            keypadRow(keys: ["4", "5", "6"])
            keypadRow(keys: ["7", "8", "9"])
            keypadRow(keys: ["C", "0", "⌫"])
        }
    }

    private func keypadRow(keys: [String]) -> some View {
        HStack(spacing: 10) {
            ForEach(keys, id: \.self) { key in
                KeyButton(key: key, action: {
                    handleKeyPress(key)
                })
            }
        }
    }
    
    private var nextButton: some View {
        Button("Next") {
            navigateToNextScreen = true
        }
        .foregroundColor(.white)
        .frame(maxWidth: 150, maxHeight: 44)
        .background(Color.blue)
        .cornerRadius(8)
        .padding(.top, 20)
        .background(
            NavigationLink(destination: Frame20View(bodyTemperature: temperature), isActive: $navigateToNextScreen) {
                EmptyView()
            }
        )
    }
    
    private func handleKeyPress(_ key: String) {
        switch key {
        case "⌫": temperature = String(temperature.dropLast())
        case "C": temperature = ""
        default: if temperature.count < 5 && key != "⌫" && key != "C" { temperature.append(key) }
        }
    }
}

struct KeyButton: View {
    var key: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(key)
                .font(.title)
                .frame(width: 60, height: 60)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
        }
    }
}

struct BodyTemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        BodyTemperatureView()
    }
}

