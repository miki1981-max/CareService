//
//  RecommendationsView1.swift
//  CareService
//
//  Created by Kamila Ponomarova on 2025-05-22.
//



import SwiftUI

struct RecommendationsView1: View {
    @State private var firebase = Firebasecode()
    var body: some View {
        NavigationView {
            VStack {
                
                    
                Text("Recommendations for a person who uses a cane or walkers. The steps described below can be done either by a sick person independently or with the help of an assistant.")
                
                    .navigationBarTitle("Recommendations", displayMode:.inline)
                    
                VStack {
                    Text("NOTE: The survey is reserved for registered users! Please ignore otherwise.")
                    
                    NavigationLink(destination: Survey12()) {
                        Text("Do a survey")
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                            .frame(width: 300, height: 50)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom))
                    }
                    .frame(width: 300, height: 50)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .padding()
                    
                    NavigationLink(destination: Fillinginformation1()) {
                        Text("List of symptoms")
                            .font(.largeTitle)
                            .frame(width: 300, height: 50)
                            .background(Color.white)
                        }
                        .frame(width: 320, height: 50)
                        .background(Color.white)
                        .fontWeight(.medium)
                        .cornerRadius(15)
                        Text("Write the care receiver's symptoms into a diary...")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                        
                        NavigationLink(destination: Frame24View()) {
                            Text("Comfort & safety")
                                .padding()
                                .font(.largeTitle)
                        }
                        .frame(width: 320, height: 50)
                        .background(Color.white)
                        .fontWeight(.medium)
                        .cornerRadius(15)
                        
                        Text("Check whether the care receiver's in comfortable condition and feels safe. Make sure you follow all steps.")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                        
                        NavigationLink(destination: Frame24View()) {
                            Text("Hygiene")
                                .font(.largeTitle)
                        }
                        .padding()
                        .frame(width: 320, height: 50)
                        .background(Color.white)
                        .fontWeight(.medium)
                        .cornerRadius(15)
                        
                        Text("Hygiene plays an extremely important role in the life of a person with diabetes. Make sure you follow all steps.")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                        
                        NavigationLink(destination: RecommendationsView2()) {
                            Text("Next page")
                        }
                        .padding()
                        .frame(width: 115, height: 50)
                        .background(Color.white)
                        .fontWeight(.medium)
                        .cornerRadius(15)
                    
                        NavigationLink(destination: WelcomePage()) {
                            Text("Sign Out")
                        }
                        .frame(width: 100, height: 40)
                        .foregroundColor(.white)
                        .background(LinearGradient(
                                gradient: Gradient(colors: [Color.purple, Color.blue]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .simultaneousGesture(TapGesture().onEnded {
                            firebase.userLogout()
                        })
                        )
                    }
                    .frame(maxWidth: 800, maxHeight: 900)
                    .background(Color.background)
                }
            }
            .background(Color.background)
        }
    }

#Preview {
    RecommendationsView1()
}
