//
//  MonthStruct.swift
//  HungryApp
//
//  Created by Daniel Madjar on 8/4/22.
//

import Foundation

struct MonthStruct {
    var monthType : MonthType
    var dayInt : Int
    
    func day() -> String {
        return String(dayInt)
    }
}

enum MonthType {
    case Previous
    case Current
    case Next
}
