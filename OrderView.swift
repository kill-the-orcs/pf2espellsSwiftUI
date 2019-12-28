//
//  OrderView.swift
//  SpellsV2
//
//  Created by Rick Cruces on 10/25/19.
//  Copyright © 2019 Rick Cruces. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    
    @State var isAddPresented = false
    @State private var showingAlertArcane = false
    @State private var showingAlertDivine = false
    @State private var showingAlertOccult = false
    @State private var showingAlertPrimal = false
    @State private var showingAlertClear = false

    
    @EnvironmentObject var order: Order
    @State private var searchTerm: String = ""
    
   

    var body: some View {
        
        
        
        NavigationView {
            VStack {
                Text("Swipe to Remove, Tap + to Prepare")
                .foregroundColor(Color.red)
                .font(.footnote)

                 SearchBar(text: $searchTerm)
                List {
                   
                            
                            ForEach(order.entry.filter{
                            self.searchTerm.isEmpty ? true :
                                "\($0)".localizedCaseInsensitiveContains(self.searchTerm)
                        }, id: \.self) {
                            item in
                        
                            NavigationLink(destination: OrderDetail(entry: item)){
                                OrderRow(entry: item)
                                    
                                }
                            }.onDelete(perform: deleteItems)
                            
                        }
                    
                
               
               Section(header: Text("Add all of one tradition")){
                    
                    VStack(alignment: .center){
                            HStack{
                            Button("Arcane") {
                                self.showingAlertArcane.toggle()
                               // self.order.addAllArcane()
                                print("Arcane!")
                            }.alert(isPresented: $showingAlertArcane) {
                            Alert(title: Text("Prepared!"), message: Text("Are you sure you want to clear current spell book and add all Arcane Spells?"), primaryButton: Alert.Button.default(Text("Yes"), action: {
                                print("Yes Arcane")
                                self.order.addAllArcane()
                                }), secondaryButton: Alert.Button.cancel(Text("No"), action: {
                                print("No clicked")
                            }))
                            }
                            .padding(5)
                                .background(Color.purple)
                                .foregroundColor(.white)
                            .overlay(
                            RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.purple, lineWidth: 4)
                                                            )
                            .padding(5)
                                    
                                
                                Button("Divine") {
                                    self.showingAlertDivine.toggle()

                                   // self.order.addAllDivine()
                                    print("Divine!")
                                }.alert(isPresented: $showingAlertDivine) {
                                Alert(title: Text("Prepared!"), message: Text("Are you sure you want to clear current spell book and add all Divine Spells?"), primaryButton: Alert.Button.default(Text("Yes"), action: {
                                    print("Yes Divine")
                                    self.order.addAllDivine()
                                    }), secondaryButton: Alert.Button.cancel(Text("No"), action: {
                                    print("No clicked")
                                }))
                                }
                                .padding(5)
                                    .background(Color.yellow)
                                    .foregroundColor(.white)
                                .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.yellow, lineWidth: 4)
                                                                )
                            .padding(5)
                            
                                Button("Occult") {
                                    self.showingAlertOccult.toggle()

                                   // self.order.addAllOccult()
                                    print("Occult!")
                                }.alert(isPresented: $showingAlertOccult) {
                                Alert(title: Text("Prepared!"), message: Text("Are you sure you want to clear current spell book and add all Occult Spells?"), primaryButton: Alert.Button.default(Text("Yes"), action: {
                                    print("Yes Occult")
                                    self.order.addAllOccult()
                                    }), secondaryButton: Alert.Button.cancel(Text("No"), action: {
                                    print("No clicked")
                                }))
                                }
                                .padding(5)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.blue, lineWidth: 4)
                                                                )
                            .padding(5)
                                Button("Primal") {
                                    self.showingAlertPrimal.toggle()

                                 //   self.order.addAllPrimal()
                                    print("Primal!")
                                } .alert(isPresented: $showingAlertPrimal) {
                                               Alert(title: Text("Prepared!"), message: Text("Are you sure you want to clear current spell book and add all Primal Spells?"), primaryButton: Alert.Button.default(Text("Yes"), action: {
                                                   print("Yes Primal")
                                                   self.order.addAllPrimal()
                                                   }), secondaryButton: Alert.Button.cancel(Text("No"), action: {
                                                   print("No clicked")
                                               }))
                                               }
                                .padding(5)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.green, lineWidth: 4)
                                                                )
                                    
                            .padding(5)
                            }
                            Button("Clear Current Spellbook") {
                                self.showingAlertClear.toggle()

                              //  self.order.clearBook()
                                print("Cleared!")
                                } .alert(isPresented: $showingAlertClear) {
                                        Alert(title: Text("Prepared!"), message: Text("Are you sure you want to clear current spell book?"), primaryButton: Alert.Button.default(Text("Yes"), action: {
                                            print("Yes Clear")
                                            self.order.clearBook()
                                            }), secondaryButton: Alert.Button.cancel(Text("No"), action: {
                                                print("No clicked")
                                                           }))
                                                           }

                            .padding(5)
                                .background(Color.red)
                                .foregroundColor(.white)
                            
                            .overlay(
                            RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.red, lineWidth: 4)
                                                            )
                            .padding(5)
                    }
                    }
                
                
               
               
             
                
            }.navigationBarTitle("Spellbook")
                 .listStyle(GroupedListStyle())
                    .navigationBarItems(trailing: Button("Saved Spellbooks")
                    {self.isAddPresented.toggle()
                            
                            print("SpellBooks!")
                            
                    }.padding(2)
                        .background(Color.blue)
                        .foregroundColor(.white)
                    .overlay(
                    RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.blue, lineWidth: 4)
                                                    )
                        )
            }.sheet(isPresented: $isAddPresented,
                    onDismiss: { self.isAddPresented = false }) {
                 SavedView()
             }
            
            }
        
    
    func deleteItems(at offsets: IndexSet) {
        order.entry.remove(atOffsets: offsets)
    }

}


struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
