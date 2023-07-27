//
//  DataFlowApp.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/24/23.
//

import SwiftUI

@main
struct DataFlowApp: App {
    @StateObject private var userManager = UserManager(
        user: StorageManager.shared.fetchUser()
    )
    
    private let storageManager = StorageManager.shared
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(userManager)
        }
    }
}
