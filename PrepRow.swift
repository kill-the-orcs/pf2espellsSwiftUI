//
//  PrepRow.swift
//  SpellsV2
//
//  Created by Rick Cruces on 11/13/19.
//  Copyright © 2019 Rick Cruces. All rights reserved.
//

import SwiftUI

struct PrepRow: View {
    @State var isAddPresented = false
    @State var prepCount: Int = 0
    @State var isChecked: Bool = false
    @State var isCheckedImage: String = "square"
    @EnvironmentObject var order: Order
    var entry1: SpellCall
    var body: some View {
        
                HStack {
          
                        HStack {
                            Text(entry1.level)
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                            Text("-")
                            Text(entry1.name)
                            .font(.system(size: 17))
                            Text(",")
                            if (entry1.imageName.contains("Action")){
                            Image(entry1.imageName)
                                .padding(3)
                            }
                            else if (entry1.imageName.contains("DoubleAction")){
                            Image(entry1.imageName)
                                .padding(3)
                            }
                            else if (entry1.imageName.contains("Reaction")){
                            Image(entry1.imageName)
                                .padding(3)
                            }
                            else if (entry1.imageName.contains("OnetoThree")){
                                           Image(entry1.imageName)
                                               .padding(3)
                            }
                            else if (entry1.imageName.contains("ThreeActions")){
                                           Image(entry1.imageName)
                                               .padding(3)
                            }
                            else{
                                Text(entry1.imageName)
                                .foregroundColor(.gray)
                                .padding(3)
                            }
                            if (entry1.heightenBool){
                                Text("H")
                                .font(.system(size: 15))
                                .fontWeight(.bold)
                                .padding(5)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                            }
                            Spacer()
                                
                                }
                        

                           
                            
                        Spacer()
            if (entry1.level != "0"){
            Image(systemName:"minus.circle").resizable()
                        .frame(width: 18, height: 18)
            .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                    .clipShape(Circle())
                        .onTapGesture {
                            
                            self.prepCount -= 1
                            if (self.prepCount < 0)
                            {
                            self.prepCount = 10
                            }
                            print("minus 1")
            }
            
            Text("\(prepCount)")
                .font(.system(size: 18))
                .frame(width: 20)
                
            Image(systemName:"plus.circle").resizable()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                                    .clipShape(Circle())
                                    .onTapGesture {
                                        
                                        self.prepCount += 1
                                        if (self.prepCount > 10)
                                        {
                                        self.prepCount = 0
                                        }
                                        print("plus 1")
                                    }
                            }
                        }
                    }
    func uncheckAll() {
       isChecked = false
        
    }

                }
            
        



struct PrepRow_Previews: PreviewProvider {
    static var previews: some View {
        PrepRow(entry1: SpellCall.example)
    }
}
