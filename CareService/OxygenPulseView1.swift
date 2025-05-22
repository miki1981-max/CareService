//
//  OxygenPulseView1.swift
//  CareService
//
//  Created by Kamila Ponomarova on 2025-05-22.
//



import SwiftUI

struct OxygenPulseView1: View {
    @State private var oxygendata = ""
    @State private var pulsedata = ""
    @State private var navigateToNextScreen = false // State to control navigation
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundView
                contentStack
            }
            .navigationBarHidden(true) // Optionally hide the navigation bar
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
            Text("Oxygen and pulse").font(.headline)
            Text("Please enter your or the care receiver's oygen saturation data and pulse")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
        }.padding(.top, 20)
    }
    
    private var inputSection: some View {
        VStack {
            HStack {
                VStack {
                    Text("Sp02")
                    TextField("", text: $oxygendata)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100)
                    Text("%").font(.headline)
                }
                VStack {
                    Text("Pulse")
                    TextField("", text: $pulsedata)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100)
                    Text("per minute").font(.headline)
                }
            }.padding(.top, 20)
        }
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
            navigateToNextScreen = true // Trigger navigation
        }
        .foregroundColor(.white)
        .frame(maxWidth: 150, maxHeight: 44)
        .background(Color.blue)
        .cornerRadius(8)
        .padding(.top, 20)
        .background(
            NavigationLink(destination: OxygenPulseView2(oxygen: oxygendata, value2: "", pulse: pulsedata), isActive: $navigateToNextScreen) {
                EmptyView() // Invisible navigation link activated by the button
            }
        )
    }
    
    private func handleKeyPress(_ key: String) {
        switch key {
        case "⌫": oxygendata = String(oxygendata.dropLast())
        case "C": oxygendata = ""
        default: if oxygendata.count < 5 && key != "⌫" && key != "C" { oxygendata.append(key) }
        }
    }
}

struct OxygenPulseView1_Previews: PreviewProvider {
    static var previews: some View {
        OxygenPulseView1()
    }
}
