//
//  CalendarSwiftUI.swift
//  HungryApp
//
//  Created by Daniel Madjar on 8/4/22.
//

import SwiftUI

struct CalendarSwiftUI: View {
    @EnvironmentObject var hungryDataArray : HungryDataArray
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.time, order: .reverse)]) var dataArray: FetchedResults<HungerObject>
    @EnvironmentObject var dateHolder: DateHolder
    
    @State var dataViewOpened = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 1) {
                DateScrollerView()
                    .environmentObject(dateHolder)
                    .padding()
                
                dayOfWeekStack
                
                calendarGrid
            }
            .disabled(dataViewOpened)
            
            if dataViewOpened {
                DataView(dataViewOpened: $dataViewOpened)
                    .environmentObject(hungryDataArray)
            }
        }
    }
    
    var dayOfWeekStack: some View {
        HStack(spacing: 1) {
            Text("Sun").dayOfWeek()
            Text("Mon").dayOfWeek()
            Text("Tue").dayOfWeek()
            Text("Wed").dayOfWeek()
            Text("Thu").dayOfWeek()
            Text("Fri").dayOfWeek()
            Text("Sat").dayOfWeek()
        }
    }
    
    var calendarGrid: some View {
        
        VStack(spacing: 1) {
            let daysInMonth = CalendarHelper().daysInMonth(dateHolder.date)
            let firstDayOfMonth = CalendarHelper().firstOfMonth(dateHolder.date)
            let startingSpaces = CalendarHelper().weekDay(firstDayOfMonth)
            let prevMonth = CalendarHelper().minusMonth(dateHolder.date)
            let dayInPrevMonth = CalendarHelper().daysInMonth(prevMonth)
            
            ForEach(0..<6) { row in
                HStack(spacing: 1) {
                    ForEach(1..<8) { column in
                        let count = column + (row * 7)
                        CalendarCell(dataViewOpened: $dataViewOpened, count: count, startingSpaces: startingSpaces, daysInMonth: daysInMonth, daysInPrevMonth: dayInPrevMonth)
                            .environmentObject(dateHolder)
                        //dataToCalendar is always true
                    }
                }
            }
        }
        .frame(maxHeight: .infinity)
        .padding(.bottom, 50)
    }
  
    
}

struct CalendarSwiftUI_Previews: PreviewProvider {
    static let dateHolder = DateHolder()
    
    static var previews: some View {
        CalendarSwiftUI()
            .environmentObject(dateHolder)
    }
}

extension Text {
    func dayOfWeek() -> some View {
        self.frame(maxWidth: .infinity)
            .padding(.top, 1)
            .lineLimit(1)
    }
}
