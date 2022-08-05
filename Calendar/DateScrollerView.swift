//
//  DateScrollerView.swift
//  HungryApp
//
//  Created by Daniel Madjar on 8/4/22.
//

import SwiftUI

struct DateScrollerView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: previousMonth) {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .font(Font.title.weight(.bold))
                    .foregroundColor(Color("DarkGreen"))
            }
            
            Text(CalendarHelper().monthYearString(dateHolder.date))
                .font(.title)
                .bold()
                .animation(.none)
                .frame(maxWidth: .infinity)
            
            Button(action: nextMonth) {
                Image(systemName: "arrow.right")
                    .imageScale(.large)
                    .font(Font.title.weight(.bold))
                    .foregroundColor(Color("DarkGreen"))
            }
            
            Spacer()
        }
    }
    
    func previousMonth() {
        dateHolder.date = CalendarHelper().minusMonth(dateHolder.date)
    }
    
    func nextMonth() {
        dateHolder.date = CalendarHelper().plusMonth(dateHolder.date)
    }
}

struct DateScrollerView_Previews: PreviewProvider {
    
    static let dateHolder = DateHolder()
    
    static var previews: some View {
        DateScrollerView()
            .environmentObject(dateHolder)
    }
}
