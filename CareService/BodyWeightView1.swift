//
//  BodyWeightView1.swift
//  CareService
//
//  Created by Kamila Ponomarova on 2025-05-22.
//

//
//  

import SwiftUI

struct BodyWeightView1: View {
    @State private var weight = ""
    @State private var navigateToNextScreen = false

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Color("background").ignoresSafeArea()

                    VStack {
                        titleSection
                        inputSection
                        keypadSection

                        Button("Next") {
                            navigateToNextScreen = true
                        }
                        .foregroundColor(.white)
                        .frame(width: min(geometry.size.width * 0.4, 150), height: 44)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding(.top, 20)
                        .navigationDestination(isPresented: $navigateToNextScreen) {
                            BodyWeightView2(bodyweight: weight)
                        }
                    }
                    .padding()
                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                }
            }
        }
    }

    private var titleSection: some View {
        VStack {
            Text("List of symptoms").font(.largeTitle).bold()
            Text("Body Weight").font(.headline)
            Text("Please enter your or the care receiver's body weight")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
        }
        .padding(.top, 20)
    }

    private var inputSection: some View {
        VStack {
            TextField("Enter the weight", text: $weight)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 150)
            Text("lbs/kg").font(.headline)
        }
        .padding(.top, 20)
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
                KeyButton(key: key) {
                    handleKeyPress(key)
                }
            }
        }
    }

    private func handleKeyPress(_ key: String) {
        switch key {
        case "⌫":
            weight = String(weight.dropLast())
        case "C":
            weight = ""
        default:
            if weight.count < 5 && key != "⌫" && key != "C" {
                weight.append(key)
            }
        }
    }
}

struct BodyWeightView1_Previews: PreviewProvider {
    static var previews: some View {
        BodyWeightView1()
    }
}
