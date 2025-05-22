//
//  //
//  Frame26View.swift
//  You and me project
//
//  Created by Kaukab Farrukh on 2025-02-05.
//

import SwiftUI

struct Frame26View: View {
    @State private var selectedCategory: String?

    var body: some View {
        NavigationStack {
            VStack {
                Text("Library")
                    .font(.title)
                    .bold()
                    .padding(.top, 100)

                Text("Here you can find links to helpful articles on caring for elderly or sick persons.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.top, 50)

                Spacer(minLength: 50)

                NavigationLink(
                    destination: LinksListView3(category: "Nutrition", links: nutritionLinks),
                    tag: "Nutrition",
                    selection: $selectedCategory
                ) {
                    Button("Nutrition") {
                        selectedCategory = "Nutrition"
                    }
                    .buttonStyle(Frame26ButtonStyle())
                }

                NavigationLink(
                    destination: LinksListView3(category: "Benefits of Walking", links: benefitsofwalkingLinks),
                    tag: "Benefits of Walking",
                    selection: $selectedCategory
                ) {
                    Button("Benefits of Walking") {
                        selectedCategory = "Benefits of Walking"
                    }
                    .buttonStyle(Frame26ButtonStyle())
                }

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Background"))
            .ignoresSafeArea()
        }
    }

    
    private var nutritionLinks: [String] {
        [
            "https://www.nia.nih.gov/health/healthy-eating-nutrition-and-diet/healthy-meal-planning-tips-older-adults",
            "https://www.nia.nih.gov/health/healthy-eating-nutrition-and-diet/how-read-food-and-beverage-labels"
        ]
    }

    
    private var benefitsofwalkingLinks: [String] {
        [
            "https://www.nia.nih.gov/health/exercise-and-physical-activity/real-life-benefits-exercise-and-physical-activity",
            "https://www.nia.nih.gov/news/leisure-activities-may-improve-longevity-older-adults"
        ]
    }
}

struct Frame26ButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct Frame26View_Previews: PreviewProvider {
    static var previews: some View {
        Frame26View()
    }
}
