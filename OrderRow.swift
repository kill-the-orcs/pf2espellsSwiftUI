//
//  OrderRow.swift
//  SpellsV2
//
//  Created by Rick Cruces on 10/26/19.
//  Copyright © 2019 Rick Cruces. All rights reserved.
//

import SwiftUI

struct OrderRow: View {
    @EnvironmentObject var order: Order
    @State private var showingAlert = false

    static let colors: [String: Color] = ["Arcane": .purple, "Divine": .orange, "Occult": .blue, "Primal": .green]
    var entry: SpellCall
    var body: some View {
        
        HStack {
            NavigationLink(destination: OrderDetail(entry: entry)){
                    HStack {
                        Text(entry.level)
                            .fontWeight(.bold)
                        Text("-")
                        Text(entry.name)
                        if (entry.imageName.contains("Action")){
                        Image(entry.imageName)
                            .padding(3)
                        }
                        else if (entry.imageName.contains("DoubleAction")){
                        Image(entry.imageName)
                            .padding(3)
                        }
                        else if (entry.imageName.contains("Reaction")){
                        Image(entry.imageName)
                            .padding(3)
                        }
                        else if (entry.imageName.contains("OnetoThree")){
                                       Image(entry.imageName)
                                           .padding(3)
                        }
                        else if (entry.imageName.contains("ThreeActions")){
                                       Image(entry.imageName)
                                           .padding(3)
                        }
                        else{
                            Text(entry.imageName)
                            .foregroundColor(.gray)
                            .padding(3)
                        }
                        }.padding(1)
                    

            }.padding(2)
            Spacer()
            Image(systemName: "plus.app")
            .gesture(
                TapGesture()
                    .onEnded { _ in
                        self.order.addLocal(spEntry: self.entry)
                        print("Pressed!")
                        self.showingAlert = true
                        

                }
            )
        }
                        
            .alert(isPresented: $showingAlert) {
            Alert(title: Text("Prepared!"), message: Text("\(self.entry.name) added to Prepared Spells!"), dismissButton: .default(Text("Got it!")))
            }
        }
    }
    

struct OrderRow_Previews: PreviewProvider {
    static var previews: some View {
        OrderRow(entry: SpellCall.example)
    }
}




