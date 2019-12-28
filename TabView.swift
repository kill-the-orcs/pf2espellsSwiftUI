//
//  PreparedView.swift
//  SpellsV2
//
//  Created by Rick Cruces on 10/25/19.
//  Copyright © 2019 Rick Cruces. All rights reserved.
//

import SwiftUI

struct PreparedView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem{
                    Image(systemName: "list.dash")
                    Text("All Spells")
            }
            OrderView()
            .tabItem {
                Image(systemName: "square.and.pencil")
                Text("Spellbook")
            }
            PrepSpells()
            .tabItem {
                Image(systemName: "square.and.pencil")
                Text("Prepared")
            }
        }
    }
}

struct PreparedView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        PreparedView().environmentObject(order)
    }
}
