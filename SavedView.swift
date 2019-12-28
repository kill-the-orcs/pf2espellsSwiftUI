//
//  SavedView.swift
//  SpellsV2
//
//  Created by Rick Cruces on 11/11/19.
//  Copyright © 2019 Rick Cruces. All rights reserved.
//

import SwiftUI

struct SavedView: View {
    @State private var showingAlert = false

    var body: some View {
        NavigationView{
            VStack{
                Text("Saved Spellbooks")
                    .font(.title)
            List{
                Section(header: Text("Swipe down to dismiss")){
                    HStack{
                    Text("Caster 1")
                        Spacer()
                        Image(systemName: "plus.app")
                            .onTapGesture {
                                self.showingAlert = true
                                print("Loaded Caster 1")
                        }
                    }.alert(isPresented: $showingAlert) {
                    Alert(title: Text("Prepared!"), message: Text("Caster 1 Spellbook Loaded"), dismissButton: .default(Text("Got it!")))
                    }
                }
            }
        }
        }.navigationBarTitle("Saved Spellbooks")
        .listStyle(GroupedListStyle())
            
        }
    }

struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
    }
}
