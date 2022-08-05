//
//  TabBarItem.swift
//  HungryApp
//
//  Created by Daniel Madjar on 7/31/22.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case slider, game, stats, settings
    
    var iconName: String {
        switch self {
            case .slider: return "applepencil"
            case .game: return "record.circle.fill"
            case .stats: return "chart.xyaxis.line"
            case .settings: return "gearshape"
        }
    }
    
    var title: String {
        switch self {
            case .slider: return ""
            case .game: return ""
            case .stats: return ""
            case .settings: return ""
        }
    }
    
    var color: Color {
        switch self {
            case .slider: return Color("Cream")
            case .game: return Color("Cream")
            case .stats: return Color("Cream")
            case .settings: return Color("Cream")
        }
    }
}
