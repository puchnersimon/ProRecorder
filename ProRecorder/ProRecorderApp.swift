//
//  ProRecorderApp.swift
//  ProRecorder
//
//  Created by Simon Puchner on 30.06.22.
//

import SwiftUI
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print(">> your code here !!")
        return true
    }
}


@main
struct ProRecorderApp: App {
    let persistenceController = PersistenceController.shared
    
    let projectViewModel = ProjectViewModel()

    var body: some Scene {
        WindowGroup {
            TabView {
                ProjectsView()
                    .tabItem {
                        Label("Projects", systemImage: "list.bullet.rectangle.portrait")
                    }
                CalendarView()
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }
                StatisticsView()
                    .tabItem {
                        Label("Statistics", systemImage: "align.vertical.bottom")
                    }
            }
            .environmentObject(projectViewModel)
        }
    }
}





