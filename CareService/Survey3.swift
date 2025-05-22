//
//  Survey3.swift
//  CareService
//
//  Created by Kamila Ponomarova on 2025-05-22.
//



import SwiftUI

struct CheckboxItem {
    var name: String
    var isChecked: Bool
}
struct CheckboxView: View {
    @Binding var item : CheckboxItem
    
    var body: some View {
        VStack {
            HStack {
                Text(item.name)
                Spacer()
                Image(systemName:item.isChecked ? "checkmark.circle.fill"
                  :"circle")
                .foregroundColor(item.isChecked ?
                .green:.gray)
                .font(.system(size:22))
                .onTapGesture {
                    item.isChecked.toggle()
                }
            }
        }
    }
}

struct Survey3: View {
    @State private var items = [
        CheckboxItem(name:"moves with the help of walkers",isChecked: false),
        CheckboxItem(name:"can not walk but can sit without support",isChecked: false),
        CheckboxItem(name:"always lies",isChecked: false),
    ]
    var body: some View {
        NavigationView {
            VStack(){
                
                Text("4.How does the care receiver move?")
                    .font(.headline)
                    .padding(.top,70)
                    .padding(.leading,-50)
                    .navigationBarTitle("Survey 2",
                    displayMode:.inline)
                List{
                    ForEach($items,id:\.name){
                        $item in
                        CheckboxView(item:$item)
                    }
                }
                NavigationLink(destination: RecommendationsView1()) {
                    Text("Finish and go back to recommendations")
                        .frame(width: 160, height: 50)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                }
                .listStyle(PlainListStyle())
                Spacer()
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
            
            
            
        }
    }
}

struct CheckboxView_Preview:PreviewProvider{
    static var previews:some View {
        Survey3()
    }
}
