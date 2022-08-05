//
//  HungryAppApp.swift
//  HungryApp
//
//  Created by Daniel Madjar on 7/31/22.
//

import SwiftUI

class HungryDataArray : ObservableObject {
    @Published var objectArray : [hungryData] = [hungryData]()
}

struct hungryData: Hashable {
    let time : String
    let scale : Int16
    let type : String
}

@main
struct HungryAppApp: App {
    @StateObject private var dataController = DataController()
    @ObservedObject var hungryDataArray = HungryDataArray()
    
    var body: some Scene {
        WindowGroup {
            let dateHolder = DateHolder()
            
            HungryTabView()
                .environmentObject(dateHolder)
                .environmentObject(hungryDataArray)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
