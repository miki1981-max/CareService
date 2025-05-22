//
//  LinksListView2.swift
//  CareService
//
//  Created by Kamila Ponomarova on 2025-05-22.
//



import SwiftUI

struct LinksListView2: View {
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

struct LinksListView2_Previews: PreviewProvider {
    static var previews: some View {
        LinksListView2(
            category: "Intimate Hygiene",
            links: [
                "https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://lab-seid.com/six-tips-keep-hygiene-intimate-prevent-infections/%3Flang%3Den&ved=2ahUKEwjB1-LK67eLAxVCFRAIHdzRJGUQFnoECDQQAQ&usg=AOvVaw2yipv3ZrOyxLxVshlVf3zR",
                "https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://www.cumlaudelab.com/en/how-to-choose-the-best-intimate-hygiene-product/&ved=2ahUKEwjB1-LK67eLAxVCFRAIHdzRJGUQFnoECC4QAQ&usg=AOvVaw0wqjmWuDgIGd_BnATJTxB8"
            ]
        )
    }
}
