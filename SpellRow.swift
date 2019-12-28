//
//  SpellRow.swift
//  SpellsV2
//
//  Created by Rick Cruces on 10/25/19.
//  Copyright © 2019 Rick Cruces. All rights reserved.
//

import SwiftUI
extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}
struct SpellRow: View {
    @State private var showingAlert2 = false

    @EnvironmentObject var order: Order
    static let colors: [String: Color] = ["Arcane": .purple, "Divine": .orange, "Occult": .blue, "Primal": .green]
    var entry: SpellCall
    var body: some View {
        NavigationLink(destination: SpellDetail(entry: entry)){
            HStack {
                Text(entry.name)
                    .fontWeight(.semibold)
                
                Spacer()
                ForEach(entry.traditions, id: \.self){
                    tradition in
                    Text(tradition[0])
                        
                        .fontWeight(.bold)
                    .padding(5)
                    .background(Self.colors[tradition, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
                    
                }.padding(1)
            }.padding(2)
              .animation(.spring())
            .simultaneousGesture(
                DragGesture(minimumDistance: 50)
                    .onEnded { _ in
                        self.order.add(spEntry: self.entry)
                        self.showingAlert2 = true

                        print("Dragged!")
                    }
            )
                .animation(.spring())
            .alert(isPresented: $showingAlert2) {
            Alert(title: Text("Added!"), message: Text("\(self.entry.name) added to Spellbook!"), dismissButton: .default(Text("Got it!")))
            }

        }
}
}
struct SpellRow_Previews: PreviewProvider {
    static var previews: some View {
        SpellRow(entry: SpellCall.example)
    }
}
