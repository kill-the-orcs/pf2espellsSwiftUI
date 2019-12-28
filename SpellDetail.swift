//
//  SpellDetail.swift
//  SpellsV2
//
//  Created by Rick Cruces on 10/25/19.
//  Copyright © 2019 Rick Cruces. All rights reserved.
//

import SwiftUI
import UIKit

struct SpellDetail: View {
   @EnvironmentObject var order: Order
    var entry: SpellCall
    static let colors: [String: Color] = ["Arcane": .purple, "Divine": .orange, "Occult": .blue, "Primal": .green, "Attack": .red, "Verbal": .blue, "Somatic": .green, "Material": .pink, "Focus": .yellow, "Heightened": .orange, "Uncommon": .orange]
    
    static let heightenColors: [String: Color] = ["(+1)": .blue, "(+2)": .blue, "(+3)": .blue, "(+4)": .blue, "(+5)": .blue, "(1st)": .blue, "(2nd)": .blue, "(3rd)": .blue, "(4th)": .blue, "(5th)": .blue, "(6th)": .blue, "(7th)": .blue, "(8th)": .blue, "(9th)": .blue, "10th": .blue]
    static let desColors: [String: Color] = ["Success": .green, "Critical Success": .green, "Failure": .red, "Critical Failure": .red]
    
   
    
    var body: some View {
      
        
        VStack(alignment: .leading) {

            HStack {
                ForEach(entry.traditions, id: \.self){
                tradition in
                    Text(tradition)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    .padding(3)
                    .background(Self.colors[tradition, default: .black])
                    .foregroundColor(.white)
                }.padding(3)
            }
            HStack {
                ForEach(entry.traits, id: \.self){
                trait in
                    Text(trait)
                        .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(1)
                    .background(Self.colors[trait, default: Color(#colorLiteral(red: 0.5097557107, green: 0.00477220835, blue: 0, alpha: 1))])
                    .foregroundColor(.white)
                 
                }
            }.padding(3)
            HStack {
                Text("Cast:")
                    .fontWeight(.medium)
                .foregroundColor(.red)
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
                    .padding(3)
                }
                Spacer()
            Button("Add to Spellbook") {
                self.order.add(spEntry: self.entry)
            }.font(.headline)
                .padding(3)
            }
        
                HStack {
                    Text("Components:")
                    ForEach(entry.components, id: \.self){
                    component in
                    Text(component[0])
                        .fontWeight(.bold)
                        .padding(5)
                        .background(Self.colors[component, default: .blue])
                        .foregroundColor(.white)
                        .clipShape(Circle())
                    }
                }.padding(3)
            ScrollView{
            VStack(alignment: .leading) {
            Text(entry.rangetarget)
                .fontWeight(.medium)
                .padding(5)
            HStack {
                Text("Saving Throw:")
                .fontWeight(.medium)
                .foregroundColor(.red)

                Text(entry.savingthrow)
            }.padding(3)
            HStack {
                Text("Duration:")
                .fontWeight(.medium)
                .foregroundColor(.red)

                Text(entry.duration)

            }.padding(6)
            Rectangle()
            .fill(Color.gray)
            .frame(width: nil, height: 2)
            ForEach(entry.description, id: \.self){
                entry in
                Text(entry)
                    .foregroundColor(Self.desColors[entry, default: .black])
                .padding(3)
            }
                .padding(3)
                Rectangle()
                .fill(Color.gray)
                .frame(width: nil, height: 2)
                if (entry.heightenBool){
                              VStack(alignment: .leading){
                    Text("Heightened:")
                        .fontWeight(.medium)
                        .foregroundColor(.red)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)

                    VStack(alignment: .leading){
                    ForEach(entry.heighten, id: \.self){height in
                        Text(height)
                        .foregroundColor(Self.heightenColors[height, default: .black])
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                            .padding(.bottom, 5)
                        }
                    }
                .lineLimit(nil)
                .padding(5)
                    
                }

                }
            Spacer()
            }
                }
        }.navigationBarTitle(entry.name)
        }
    }


struct SpellDetail_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView{
            SpellDetail(entry: SpellCall.example).environmentObject(order)
        }
    }
}
