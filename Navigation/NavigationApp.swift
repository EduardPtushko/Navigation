//
//  NavigationApp.swift
//  Navigation
//
//  Created by Eduard on 05.03.2023.
//

import SwiftUI

@main
struct NavigationApp: App {
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
