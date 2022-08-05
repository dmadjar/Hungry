//
//  SuccessView.swift
//  HungryApp
//
//  Created by Daniel Madjar on 8/3/22.
//

import SwiftUI

struct SuccessView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    @Binding var menuOpened : Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color("Cream"))
                .shadow(color: .gray, radius: 15, x: 0, y: 0)
            
            VStack(spacing: 0) {
        
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
                
                Text("YOU JUST TRACKED YOUR DATA. LOOK AT YOU GO!")
                    .font(Font.custom("Avenir Book", size: 20))
                    .foregroundColor(Color("DarkGreen"))
                    .bold()
                    .frame(width: width / 1.75, alignment: .leading)
                
               Spacer()
                    .frame(height: height / 50)
                
                Button {
                    withAnimation {
                        menuOpened = false
                    }
                } label : {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("DarkGreen"))
                            .frame(width: width / 1.75, height: height / 17.5)
                        
                        Text("YAY")
                            .font(Font.custom("Avenir Book", size: 20))
                            .foregroundColor(Color("Cream"))
                            .bold()
                    }
                }
            }
        }
        .frame(width: width / 1.3, height: height / 4)
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(menuOpened: .constant(false))
    }
}
