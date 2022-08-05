//
//  CalendarCell.swift
//  HungryApp
//
//  Created by Daniel Madjar on 8/4/22.
//

import SwiftUI



struct CalendarCell: View {
    @EnvironmentObject var hungryDataArray : HungryDataArray
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.time, order: .reverse)]) var dataArray: FetchedResults<HungerObject>
    
    @EnvironmentObject var dateHolder: DateHolder
    
    @Binding var dataViewOpened : Bool
    
    let count : Int
    let startingSpaces : Int
    let daysInMonth : Int
    let daysInPrevMonth : Int

    var body: some View {
        VStack(spacing: 20) {
            if dataToCalendar() && (monthStruct().monthType == MonthType.Current) {
                Button {
                    loadData()
                    dataViewOpened = true
                } label: {
                    Image(systemName: "arrow.down.square.fill")
                        .foregroundColor(Color("DarkGreen"))
                }
            }
            
            Text(monthStruct().day())
                .foregroundColor(textColor(type: monthStruct().monthType))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func textColor(type: MonthType) -> Color {
        return type == MonthType.Current ? Color.black : Color.gray
    }
    
    func monthStruct() -> MonthStruct {
        let start = startingSpaces == 0 ? startingSpaces + 7 : startingSpaces
        
        if (count <= start) {
            let day = daysInPrevMonth + count - start
            return MonthStruct(monthType: MonthType.Previous, dayInt: day)
        } else if (count - start > daysInMonth) {
            let day = count - start - daysInMonth
            return MonthStruct(monthType: MonthType.Next, dayInt: day)
        }
        
        let day = count - start
        return MonthStruct(monthType: MonthType.Current, dayInt: day)
    }
    
    func loadData() {
        for datum in dataArray {
            if (dateToYearAndMonth() == datumDate(date: datum.time!)) && (monthStruct().day() == datumToDay(date: datum.time!)) {
                hungryDataArray.objectArray.append(hungryData(time: datumToHr(date: datum.time!), scale: datum.scale, type: datum.type!))
            }
        }
    }
    
    func dataToCalendar() -> Bool {
        for datum in dataArray {
            
            if (dateToYearAndMonth() == datumDate(date: datum.time!)) && (monthStruct().day() == datumToDay(date: datum.time!)) {
                return true
            }
        }
        
        return false
    }
    
    func dateToYearAndMonth() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM"
        
        return formatter.string(from: dateHolder.date)
    }
    
    func datumDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM"
        
        return formatter.string(from: date)
    }
    
    func datumToDay(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        
        return formatter.string(from: date)
    }
    
    func datumToHr(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h"
        
        return formatter.string(from: date)
    }
}

struct CalendarCell_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCell(dataViewOpened: .constant(false), count: 0, startingSpaces: 0, daysInMonth: 0 , daysInPrevMonth: 0)
    }
}
