//
//  Frame26.swift
//  CareService
//
//  Created by Kamila Ponomarova on 2025-05-22.
//



import SwiftUI

struct Frame25View: View {
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
                    destination: LinksListView2(category: "Intimate Hygiene", links: intimatehygieneLinks),
                    tag: "Intimate Hygiene",
                    selection: $selectedCategory
                ) {
                    Button("Intimate Hygiene") {
                        selectedCategory = "Intimate Hygiene"
                    }
                    .buttonStyle(Frame25ButtonStyle())
                }

                NavigationLink(
                    destination: LinksListView2(category: "Taking Medications", links: takingmedicationsLinks),
                    tag: "Taking Medications",
                    selection: $selectedCategory
                ) {
                    Button("Taking Medications") {
                        selectedCategory = "Taking Medications"
                    }
                    .buttonStyle(Frame25ButtonStyle())
                }

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Background"))
            .ignoresSafeArea()
        }
    }

    
    private var intimatehygieneLinks: [String] {
        [
            "https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://lab-seid.com/six-tips-keep-hygiene-intimate-prevent-infections/%3Flang%3Den&ved=2ahUKEwjB1-LK67eLAxVCFRAIHdzRJGUQFnoECDQQAQ&usg=AOvVaw2yipv3ZrOyxLxVshlVf3zR",
            "https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://www.cumlaudelab.com/en/how-to-choose-the-best-intimate-hygiene-product/&ved=2ahUKEwjB1-LK67eLAxVCFRAIHdzRJGUQFnoECC4QAQ&usg=AOvVaw0wqjmWuDgIGd_BnATJTxB8"
        ]
    }

    
    private var takingmedicationsLinks: [String] {
        [
            "https://www.nia.nih.gov/health/medicines-and-medication-management/taking-medicines-safely-you-age",
            "https://www.nia.nih.gov/news/dangers-polypharmacy-and-case-deprescribing-older-adults"
        ]
    }
}

struct Frame25ButtonStyle: ButtonStyle {
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

struct Frame25View_Previews: PreviewProvider {
    static var previews: some View {
        Frame25View()
    }
}
