//
//  Frame21.swift
//  CareService
//
//  Created by Kamila Ponomarova on 2025-05-22.
//



import SwiftUI

struct Frame21View: View {
    @State private var sugarLevel: String = ""
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            GeometryReader { geometry in
                ZStack {
                    Color("background")
                        .ignoresSafeArea()

                    VStack(spacing: 40) {
                        titleSection
                        inputSection
                        keypadSection
                        nextButton
                    }
                    .padding()
                    .frame(maxWidth: 600)
                    .frame(width: geometry.size.width * 0.6)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
            }
            .navigationDestination(for: String.self) { _ in
                Frame22View(bloodSugarLevel: $sugarLevel)
            }
        }
    }

    private var titleSection: some View {
        VStack(spacing: 12) {
            Text("Diary")
                .font(.largeTitle)
                .bold()

            Text("Blood Sugar Level")
                .font(.headline)

            Text("Please enter your or the care receiver's blood sugar level")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
        }
    }

    private var inputSection: some View {
        TextField("Enter sugar level", text: $sugarLevel)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.decimalPad)
            .padding(.horizontal)
    }

    private var keypadSection: some View {
        Text("Custom Keypad Here")
            .foregroundColor(.gray)
    }

    private var nextButton: some View {
        Button(action: {
            path.append("next")
        }) {
            Text("Next")
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .font(.headline)
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
}

struct Frame21View_Previews: PreviewProvider {
    static var previews: some View {
        Frame21View()
    }
}
