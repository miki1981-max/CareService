//
//  LinksListView3.swift
//  CareService
//
//  Created by Kamila Ponomarova on 2025-05-22.
//



import SwiftUI

struct LinksListView3: View {
    var category: String
    var links: [String]

    var body: some View {
        VStack(spacing: 30) {
            
            Text(category)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 120)

            Text("Here are some helpful articles:")
                .font(.headline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)

            ScrollView {
                VStack(spacing: 20) {
                    ForEach(links, id: \.self) { link in
                        Button(action: {
                            openURL(link)
                        }) {
                            HStack {
                                Text(link)
                                    .foregroundColor(.blue)
                                    .underline()
                                    .lineLimit(1)
                                    .truncationMode(.middle)
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                Image(systemName: "arrow.up.right.circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.title2)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                        .padding(.horizontal, 20)
                    }
                }
            }
            .padding(.top, 20)

            Spacer()
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
        .ignoresSafeArea()
    }

    private func openURL(_ urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}

struct LinksListView3_Previews: PreviewProvider {
    static var previews: some View {
        LinksListView3(
            category: "Nutrition",
            links: [
                "https://www.nia.nih.gov/health/healthy-eating-nutrition-and-diet/healthy-meal-planning-tips-older-adults",
                "https://www.nia.nih.gov/health/healthy-eating-nutrition-and-diet/how-read-food-and-beverage-labels"
            ]
        )
    }
}

