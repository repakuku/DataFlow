//
//  DataFlowApp.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/24/23.
//

import SwiftUI

@main
struct DataFlowApp: App {
    @StateObject private var userSettings = UserSettings()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(userSettings)
        }
    }
}
