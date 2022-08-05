//
//  CheckInView.swift
//  HungryApp
//
//  Created by Daniel Madjar on 8/3/22.
//

import SwiftUI

struct CheckInView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.time, order: .reverse)]) var dataArray: FetchedResults<HungerObject>
    
    @Binding var menuOpened : Bool
    @Binding var optionChecked : Bool
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var answers : Int16
    
    @State var selection = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color("Cream"))
                .shadow(color: .gray, radius: 15, x: 0, y: 0)
            
            VStack {
        
                Button {
                    withAnimation {
                        menuOpened = false
                    }
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
                
                Text("WHAT BRINGS YOU ON?")
                    .font(Font.custom("Avenir Book", size: 20))
                    .foregroundColor(Color("DarkGreen"))
                    .bold()
                
                Button {
                    selection = "PRE-MEAL"
                    DataController().addCheckIn(scale: answers, time: Date(), type: selection, context: managedObjectContext)
                    
                    withAnimation {
                        menuOpened = false
                        optionChecked = true
                    }
                } label : {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("DarkGreen"))
                            .frame(width: width / 1.75, height: height / 17.5)
                        
                        Text("PRE-MEAL")
                            .font(Font.custom("Avenir Book", size: 20))
                            .foregroundColor(Color("Cream"))
                            .bold()
                    }
                }
                
                Button {
                    selection = "POST-MEAL"
                    DataController().addCheckIn(scale: answers, time: Date(), type: selection, context: managedObjectContext)
                    
                    withAnimation {
                        menuOpened = false
                        optionChecked = true
                    }
                } label : {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("DarkGreen"))
                            .frame(width: width / 1.75, height: height / 17.5)
                        
                        Text("POST-MEAL")
                            .font(Font.custom("Avenir Book", size: 20))
                            .foregroundColor(Color("Cream"))
                            .bold()
                    }
                }
                
                Button {
                    selection = "CHECK-IN"
                    DataController().addCheckIn(scale: answers, time: Date(), type: selection, context: managedObjectContext)
                    
                    withAnimation {
                        menuOpened = false
                        optionChecked = true
                    }
                } label : {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("DarkGreen"))
                            .frame(width: width / 1.75, height: height / 17.5)
                        
                        Text("CHECKING IN")
                            .font(Font.custom("Avenir Book", size: 20))
                            .foregroundColor(Color("Cream"))
                            .bold()
                    }
                }
            }
        }
        .frame(width: width / 1.3, height: height / 3)
    }
}

struct CheckInView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInView(menuOpened: .constant(false), optionChecked: .constant(false), answers: 0)
    }
}
