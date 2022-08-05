//
//  HungryTabView.swift
//  HungryApp
//
//  Created by Daniel Madjar on 7/31/22.
//

import SwiftUI

struct HungryTabView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @EnvironmentObject var dateHolder: DateHolder
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .slider
       
       var body: some View {
           CustomTabBarContainerView(selection: $tabSelection) {
               
               SliderView()
                   .tabBarItem(tab: .slider, selection: $tabSelection)
               
               SliderView()
                   .tabBarItem(tab: .game, selection: $tabSelection)
               
               CalendarSwiftUI()
                   .tabBarItem(tab: .stats, selection: $tabSelection)
               
               SliderView()
                   .tabBarItem(tab: .settings, selection: $tabSelection)
               
           }
       }
}

struct HungryTabView_Previews: PreviewProvider {
    
    static let dateHolder = DateHolder()
    
    static var previews: some View {
        HungryTabView()
            .environmentObject(dateHolder)
    }
}
