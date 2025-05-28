//
//  RecommendationsView1.swift
//  CareService
//
//  Created by Kamila Ponomarova on 2025-05-22.
//



import SwiftUI

struct RecommendationsView1: View {
    @State private var firebase = Firebasecode()
    @State private var navigateToSurvey = false
    @State private var navigateToSymptoms = false
    @State private var navigateToComfort = false
    @State private var navigateToHygiene = false
    @State private var navigateToNextPage = false

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Color("background").ignoresSafeArea()

                    VStack(spacing: 20) {
                        Text("Recommendations for a person who uses a cane or walkers. The steps described below can be done either by a sick person independently or with the help of an assistant.")
                            .padding()
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)

                        Text("NOTE: The survey is reserved for registered users! Please ignore otherwise.")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.horizontal)

                        // Survey button
                        Button(action: { navigateToSurvey = true }) {
                            Text("Do a survey")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width * 0.6, height: 50)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                                                           startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(15)
                                .shadow(radius: 5)
                        }

                        // Symptoms button
                        Button(action: { navigateToSymptoms = true }) {
                            Text("List of symptoms")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .frame(width: geometry.size.width * 0.6, height: 50)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                        }

                        Text("Write the care receiver's symptoms into a diary...")
                            .foregroundColor(.white)
                            .padding(.horizontal)

                        // Comfort & Safety button
                        Button(action: { navigateToComfort = true }) {
                            Text("Comfort & safety")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .frame(width: geometry.size.width * 0.6, height: 50)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                        }

                        Text("Check whether the care receiver's in comfortable condition and feels safe. Make sure you follow all steps.")
                            .foregroundColor(.white)
                            .padding(.horizontal)

                        // Hygiene button
                        Button(action: { navigateToHygiene = true }) {
                            Text("Hygiene")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .frame(width: geometry.size.width * 0.6, height: 50)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                        }

                        Text("Hygiene plays an extremely important role in the life of a person with diabetes. Make sure you follow all steps.")
                            .foregroundColor(.white)
                            .padding(.horizontal)

                        // Next Page button
                        Button(action: { navigateToNextPage = true }) {
                            Text("Next page")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .frame(width: 140, height: 50)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                        }
                        .padding(.top, 10)

                        // Logout button
                        Button(action: {
                            firebase.userLogout()
                        }) {
                            Text("Logout")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 100, height: 40)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]),
                                                           startPoint: .top, endPoint: .bottom))
                                .cornerRadius(15)
                                .shadow(radius: 5)
                        }

                        Spacer()
                    }
                    .frame(width: geometry.size.width * 0.8)
                    .padding()
                }
                .navigationTitle("Recommendations")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(isPresented: $navigateToSurvey) { Survey12() }
                .navigationDestination(isPresented: $navigateToSymptoms) { Fillinginformation1() }
                .navigationDestination(isPresented: $navigateToComfort) { Frame24View() }
                .navigationDestination(isPresented: $navigateToHygiene) { Frame24View() }
                .navigationDestination(isPresented: $navigateToNextPage) { RecommendationsView2() }
            }
        }
    }
}

#Preview {
    RecommendationsView1()
}
