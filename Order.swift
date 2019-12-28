//
//  DailySpells.swift
//  SpellsV2
//
//  Created by Rick Cruces on 10/25/19.
//  Copyright © 2019 Rick Cruces. All rights reserved.
//


import SwiftUI


class Order: ObservableObject {
    
    @Published var entry = [SpellCall]()
    @Published var entry1 = [SpellCall]()
    @Published var entryArcane = [SpellCall]()
    @Published var entryDivine = [SpellCall]()
    @Published var entryOccult = [SpellCall]()
    @Published var entryPrimal = [SpellCall]()

    
    
    
    func add(spEntry: SpellCall) {
        if (entry.contains(spEntry)){
            
        }
        else {
            entry.append(spEntry)
            entry.sort {$0.name < $1.name}
            entry.sort {$0.level < $1.level}
        }
            
        }
    
    func addLocal(spEntry: SpellCall) {
       
            entry1.append(spEntry)
            entry1.sort {$0.name < $1.name}
            entry1.sort {$0.level < $1.level}
        
            
        }
       
    func addAllArcane(){
        entry = [SpellCall]()
        let parsedSpells = Bundle.main.decode([SpellLevel].self, from: "SpellsV1.json")
        for spell in parsedSpells{
            for individual in spell.spells{
                if individual.traditions.contains("Arcane"){
                    entryArcane.append(individual)
                                    for newEntry in entryArcane{
                                        
                                        if(entry.contains(newEntry)){
                                            
                                        }
                                        else {
                                            entry.append(newEntry)
                                        }
                                }
                    entry.sort {$0.name < $1.name}
                        entry.sort {$0.level < $1.level}
                    
                                }
                            }

                        }

                    }
    func addAllDivine(){
        entry = [SpellCall]()

        let parsedSpells = Bundle.main.decode([SpellLevel].self, from: "SpellsV1.json")
        for spell in parsedSpells{
            for individual in spell.spells{
                if individual.traditions.contains("Divine"){
                    entryDivine.append(individual)
                                    for newEntry in entryDivine{
                                        
                                        if(entry.contains(newEntry)){
                                            
                                        }
                                        else {
                                            entry.append(newEntry)
                                        }
                                }
                    entry.sort {$0.name < $1.name}
                    entry.sort {$0.level < $1.level}
                                }
                            }

                        }

                    }

    func addAllOccult(){
        entry = [SpellCall]()

        let parsedSpells = Bundle.main.decode([SpellLevel].self, from: "SpellsV1.json")
        for spell in parsedSpells{
            for individual in spell.spells{
                if individual.traditions.contains("Occult"){
                    entryOccult.append(individual)
                                    for newEntry in entryOccult{
                                        
                                        if(entry.contains(newEntry)){
                                            
                                        }
                                        else {
                                            entry.append(newEntry)
                                        }
                                }
                    entry.sort {$0.name < $1.name}
                    entry.sort {$0.level < $1.level}
                                }
                            }

                        }

                    }
    
    func addAllPrimal(){
        entry = [SpellCall]()

        let parsedSpells = Bundle.main.decode([SpellLevel].self, from: "SpellsV1.json")
        for spell in parsedSpells{
            for individual in spell.spells{
                if individual.traditions.contains("Primal"){
                    
                entryPrimal.append(individual)
                    for newEntry in entryPrimal{
                        
                        if(entry.contains(newEntry)){
                            
                        }
                        else {
                            entry.append(newEntry)
                        }
                }
                    entry.sort {$0.name < $1.name}
                    entry.sort {$0.level < $1.level}
                }
            }

        }

    }
    
    
    
    
    func clearBook(){
        entry.removeAll()
    }
    func clearPrepared(){
        entry1.removeAll()
    }
    
    func remove(spEntry: SpellCall) {
        if let index = entry.firstIndex(of: spEntry) {
            entry.remove(at: index)
        }
    }
}

