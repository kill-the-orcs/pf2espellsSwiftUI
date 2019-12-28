//
//  PrepSpells.swift
//  SpellsV2
//
//  Created by Rick Cruces on 10/31/19.
//  Copyright © 2019 Rick Cruces. All rights reserved.
//

import SwiftUI



struct PrepSpells: View {
    @State var menuOpen2: [UUID: Bool] = [:]
    @State var expectedLevel: Int = 0
    @EnvironmentObject var order: Order
    @State var isExpanded = false
    var body: some View {
        
       
        NavigationView{
            
            VStack{
                Text("Tap for Details, Swipe to remove")
                    .font(.footnote)
                    .foregroundColor(Color.red)
                List {
                   
                           ForEach(order.entry1){
                                               item1 in
                            NavigationLink(destination: PrepDetail(entry: item1)){
                            PrepRow(entry1: item1)
                            }
                       //    .onTapGesture {withAnimation {
                         //      self.menuOpen2[item1.id] = !self.isExpanded2(item1)
                           //    print("expand")
                             //  }}
                               
                                
                           if self.isExpanded2(item1){
                               Text(item1.quickDesc)
                                   .font(.system(size: 15))

                                   .fontWeight(.medium)
                                   .foregroundColor(Color.red)
                                   .multilineTextAlignment(.leading)
                           }

                           }.onDelete(perform: deleteItems1)
                            
                    
                        
                    //.listRowBackground(Color.red)
                    //set list BG color
                                
                        
                        
                }.navigationBarTitle("Prepared Spells")
                 .listStyle(GroupedListStyle())
                    .navigationBarItems(trailing: Button("Toggle Short Desc."){withAnimation{
                        for thing in self.order.entry1{
                        
                            self.menuOpen2[thing.id] = !self.isExpanded2(thing)
                            

                    }
                        }
                        print("expand!")
                    }.padding(2)
                        .background(Color.blue)
                        .foregroundColor(.white)
                    .overlay(
                    RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.blue, lineWidth: 4)
                                                    )
                )
                

                    
                Spacer()
                    VStack(alignment: .leading){
                        HStack{
                    Text("Level to Prepare = ")
                        .frame(height: 10)
                    Text("\(expectedLevel)")
                       .fontWeight(.bold)
                            .padding(6)
                            .background(Color.purple)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                            Spacer()
                            Button(action: {
                                self.expectedLevel -= 1
                                if (self.expectedLevel < 0)
                                {
                                self.expectedLevel = 0
                                }
                                print("minus 1") }) {
                                    Image("minusbutton").resizable()
                                        .frame(width: 30, height: 30)
                                        .background(Color.red)
                                    .clipShape(Circle())

                            }
                            Text("")
                                .frame(width:4)
                        Button(action: {
                            self.expectedLevel += 1
                            if (self.expectedLevel > 10)
                            {
                            self.expectedLevel = 10
                            }
                            print("added 1") }) {
                                Image("plusbutton").resizable()
                                    .frame(width: 30, height: 30)
                                    .background(Color.blue)
                                .clipShape(Circle())

                        }
                
                    
                    
                    }
                        HStack{
                    Button("Clear Prepared") {
                        self.order.clearPrepared()
                        print("Cleared!")
                    }
                    .padding(5)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .overlay(
                        RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.red, lineWidth: 4)
                                                        )
                        .padding(5)
                    Button("Prepare all of level")
                         {
                            self.addAllLevel()
                            print("Added Level!")
                    }.padding(5)
                        .background(Color.blue)
                        .foregroundColor(.white)
                    .overlay(
                    RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.blue, lineWidth: 4)
                                                    )
                        .padding(5)
                        }
                    }.padding()
                

            }
            
        
        }
    }
    
    
    
    func deleteItems1(at offsets: IndexSet) {
        order.entry1.remove(atOffsets: offsets)
        
    
    }
    
    func addAllLevel(){
      

        for thing in order.entry {
            if (thing.level == "\(expectedLevel)")
            {
                if (order.entry1.contains(thing)){
                    
                }
                else{
                order.entry1.append(thing)
            }
            order.entry1.sort {$0.name < $1.name}
            order.entry1.sort {$0.level < $1.level}
            
        }
        print("level is \(expectedLevel)")
    }
    }
    private func isExpanded2 (_ entry1: SpellCall) -> Bool {
        menuOpen2[entry1.id] ?? false
    }
    
    
}


struct PrepSpells_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        PrepSpells().environmentObject(order)
    }
}
