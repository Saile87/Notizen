//
//  NotizenApp.swift
//  Notizen
//
//  Created by Elias Breitenbach on 09.08.23.
//

import SwiftUI

@main
struct NotizenApp: App {
    
    @StateObject private var controlData = ControlData(name: "Model")
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, controlData.container.viewContext)
        }
    }
}
