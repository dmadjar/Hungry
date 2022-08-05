//
//  DataView.swift
//  HungryApp
//
//  Created by Daniel Madjar on 8/4/22.
//

import SwiftUI

struct DataView: View {
    @EnvironmentObject var hungryDataArray : HungryDataArray
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.time, order: .reverse)]) var dataArray: FetchedResults<HungerObject>
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    @Binding var dataViewOpened : Bool
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color("Cream"))
                    .shadow(color: .gray, radius: 15, x: 0, y: 0)
                
                VStack {
                    Button {
                        hungryDataArray.objectArray.removeAll()
                        dataViewOpened = false
                    } label : {
                        ZStack {
                            Circle()
                                .fill(Color("DarkGreen"))
                                .frame(width: 25, height: 25)
                            
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .foregroundColor(Color("Cream"))
                        }
                    }
                    .frame(width: width / 1.45, alignment: .trailing)
                    
                    Spacer()
                    
                    VStack(spacing: 5) {
                        HStack(spacing: 10) {
                            Text("TIME")
                                .font(Font.custom("Avenir Book", size: 12))
                                .foregroundColor(Color("DarkGreen"))
                                .bold()
                            
                            Spacer()
                            
                            Text("SCALE #")
                                .font(Font.custom("Avenir Book", size: 12))
                                .foregroundColor(Color("DarkGreen"))
                                .bold()
                            
                            Spacer()
                            
                            Text("CHECK-IN-TYPE")
                                .font(Font.custom("Avenir Book", size: 12))
                                .foregroundColor(Color("DarkGreen"))
                                .bold()
                        }
                        
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: width / 1.45, height: 3, alignment: .trailing)
                    }
                    
                    
                    ScrollView {
                        ForEach(hungryDataArray.objectArray, id: \.self) { item in
                            HStack(spacing: 10) {
                                Text(item.time)
                                
                                Spacer()
                                
                                Text("\(item.scale)")
                                
                                Spacer()
                                
                                Text(item.type)
                            }
                        }
                    }
                    
                    Spacer()
                }
                .frame(width: width / 1.45, height: height / 3.5)
            }
            .frame(width: width / 1.3, height: height / 3)
    }
}

struct DataView_Previews: PreviewProvider {
    static let hungryDataArray = HungryDataArray()
    
    static var previews: some View {
        DataView(dataViewOpened: .constant(false))
            .environmentObject(hungryDataArray)
    }
}
