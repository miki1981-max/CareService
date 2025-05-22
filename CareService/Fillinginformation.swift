//
//  Fillinginformation.swift
//  CareService
//
//  Created by Kamila Ponomarova on 2025-05-22.
//



import SwiftUI

struct Fillinginformation1: View {
    @State var firebase = Firebasecode()
    @State private var ShowAlert = true
    
    var body: some View {
        NavigationView {
            VStack {
                Text("List of symptoms")
                    .font(.title)
                    .fontWeight(.heavy)
                    .navigationBarTitle("")
                
                VStack(alignment: .leading) {
                    NavigationLink(destination: BodyWeightView1()) {
                        Text("Weight                         ")
                        Circle()
                            .stroke(lineWidth: 4)
                            .frame(width: 33, height: 33)
                            .overlay(Text("➕"))
                    }
                    .padding()
                    .frame(width: 220, height: 50)
                    .background(Color.white)
                    .fontWeight(.medium)
                    .cornerRadius(15)
                        
                    NavigationLink(destination: BloodPressureView1()) {
                        Text("Pressure                     ")
                        Circle()
                            .stroke(lineWidth: 4)
                            .frame(width: 33, height: 33)
                            .overlay(Text("➕"))
                    }
                    .padding()
                    .frame(width: 220, height: 50)
                    .background(Color.white)
                    .fontWeight(.medium)
                    .cornerRadius(10)
                        
                    NavigationLink(destination: OxygenPulseView1()) {
                        Text("Oxygen & pulse         ")
                        Circle()
                            .stroke(lineWidth: 4)
                            .frame(width: 33, height: 33)
                            .overlay(Text("➕"))
                    }
                    .padding()
                    .frame(width: 220, height: 50)
                    .background(Color.white)
                    .fontWeight(.medium)
                    .cornerRadius(10)
                        
                    NavigationLink(destination:BodyTemperatureView()) {
                        Text("Body temperature     ")
                        Circle()
                            .stroke(lineWidth: 4)
                            .frame(width: 33, height: 33)
                            .overlay(Text("➕"))
                    }
                    .padding()
                    .frame(width: 220, height: 50)
                    .background(Color.white)
                    .fontWeight(.medium)
                    .cornerRadius(10)
                        
                    NavigationLink(destination: Frame21View()) {
                        Text("Sugar level                  ")
                        Circle()
                            .stroke(lineWidth: 4)
                            .frame(width: 33, height: 33)
                            .overlay(Text("➕"))
                    }
                    .padding()
                    .frame(width: 220, height: 50)
                    .background(Color.white)
                    .fontWeight(.medium)
                    .cornerRadius(10)
                    
                    //Circle().stroke(lineWidth: 4).frame(width:33, height:33).overlay(Text("➕").font(.system(size:33)))
                }
                .frame(maxWidth: 800, maxHeight: 900)
                .background(Color.background)
            }
            .alert(isPresented: $ShowAlert) {
                Alert(title: Text("NOTICE"), message: Text("The information you specify about yourself or your care receiver in these fields will be saved for the purposes of determining optimal procedures of care."), dismissButton: .default(Text("OK")))
            }
        }
        .background(Color.background)
        
    }
}

#Preview {
    Fillinginformation1()
}
