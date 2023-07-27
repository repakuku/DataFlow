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
    
    private let storageManager = StorageManager.shared
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(userSettings)
                .onAppear {
                    storageManager.loadUser(with: userSettings)
                }
        }
    }
}
