//
//  InformationMenu.swift
//  HungryApp
//
//  Created by Daniel Madjar on 8/1/22.
//

import SwiftUI

struct InformationMenu: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    @Binding var menuOpened : Bool
    
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
                            .frame(width: 30, height: 30)
                        
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(Color("Cream"))
                    }
                }
                .frame(width: width / 1.4, alignment: .trailing)
                
                ScrollView {
                    VStack(spacing: 10) {
                        Text("WELCOME TO HUNGRY!")
                            .font(Font.custom("Avenir Book", size: 20))
                            .foregroundColor(Color("DarkGreen"))
                            .bold()
                            .frame(width: width / 1.4, alignment: .leading)
                        
                        Text("Hungry! is an app that's all about getting in tune with our bodies, eating without distraction, and creating a healthier relationship with food, through empowered eating")
                            .frame(width: width / 1.4, alignment: .leading)
                            .font(Font.custom("Avenir Book", size: 15))
                            .foregroundColor(Color("DarkGreen"))
                        
                        Spacer()
                            .frame(height: 5)
                        
                        Text("HOW IT WORKS?")
                            .font(Font.custom("Avenir Book", size: 20))
                            .foregroundColor(Color("DarkGreen"))
                            .bold()
                            .frame(width: width / 1.4, alignment: .leading)
                        
                        Text("One of the main functionalities of Hungry! is the hungar scale tool. This is a helpful visualization tool that can be used to guide our eating habits. Simply slide the scale to the number that correlates with your current hunger/satiety levels and Hungry! tracks the data.")
                            .font(Font.custom("Avenir Book", size: 15))
                            .foregroundColor(Color("DarkGreen"))
                            .frame(width: width / 1.4, alignment: .leading)
                        
                        Spacer()
                            .frame(height: 5)
                        
                        Text("The scale ranges from -10 to 10. The goal is to remain within a comfortable range of -2 to 2 throughout the day")
                            .font(Font.custom("Avenir Book", size: 15))
                            .foregroundColor(Color("DarkGreen"))
                            .frame(width: width / 1.4, alignment: .leading)
                        
                        Spacer()
                            .frame(height: 5)
                        
                        Text("HOW DO I KNOW WHAT MY LEVEL OF HUNGER IS?")
                            .font(Font.custom("Avenir Book", size: 20))
                            .foregroundColor(Color("DarkGreen"))
                            .bold()
                            .frame(width: width / 1.4, alignment: .leading)
                    }
                    
                }
                .frame(width: width / 2, height: height / 2.1)
            }
        }
        .frame(width: width / 1.25, height: height / 1.7)
    }
}

struct InformationMenu_Previews: PreviewProvider {
    static var previews: some View {
        InformationMenu(menuOpened: .constant(true))
    }
}
