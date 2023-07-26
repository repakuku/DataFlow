//
//  RootView.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/24/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var userSettings: UserSettings
    
    private let storageManager = StorageManager.shared
    
    var body: some View {
        Group {
            if userSettings.isRegistered {
                ContentView()
            } else {
                LoginView()
            }
        }
        .onAppear {
            storageManager.loadUser(with: userSettings)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(UserSettings())
    }
}
