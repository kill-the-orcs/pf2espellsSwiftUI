//
//  SpellList.swift
//  PF2E Spell RSD
//
//  Created by Rick Cruces on 10/24/19.
//  Copyright © 2019 Rick Cruces. All rights reserved.
//

import SwiftUI

struct SpellLevel: Codable, Identifiable {
    var id: UUID
    var name: String
    var isExpanded: Bool
    var spells: [SpellCall]
    
}


struct SpellCall: Codable, Equatable, Identifiable, Hashable {
    var id: UUID
    var name: String
    var level: String
    var levelName: String
    var source: String
    var traits: [String]
    var traditions: [String]
    var actions: [String]
    var components: [String]
    var rangetarget: String
    var savingthrow: String
    var duration: String
    var description: [String]
    var heighten: [String]
    var heightenBool: Bool
    var imageName: String
    var quickDesc: String
    var spellCount: Int
   
    

    #if DEBUG
    static let example = SpellCall(id: UUID(), name: "Acid Splash", level: "0", levelName: "Level 1 Spells",source: "Core Rulebook", traits: ["Acid", "Attack", "Cantrip", "Evocation"], traditions: ["Arcane", "Primal"],  actions: ["A", "A"], components: ["Verbal", "Somatic"], rangetarget: "Range 120 feet; Targets 1 creature or object.", savingthrow: "none", duration: "-", description: ["You conjure an arrow of acid that continues corroding the target after it hits. Make a spell attack against the target. On a hit, you deal 3d8 acid damage plus 1d6 persistent acid damage. On a critical hit, double the initial damage, but not the persistent damage."], heighten: ["(+2)"," The initial damage increases by 2d8, and the persistent acid damage increases by 1d6."], heightenBool: true, imageName: "DoubleAction", quickDesc: "1d6 Acid dmg + 1 splash dmg", spellCount: 1)

    #endif

}
