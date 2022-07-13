//
//  ProRecorderApp.swift
//  ProRecorder
//
//  Created by Simon Puchner on 13.07.22.
//

import SwiftUI

@main
struct ProRecorderApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
