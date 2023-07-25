//
//  RootView.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/24/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var userSettings: UserSettings
    @AppStorage("user") var userStorage = Data()
    
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
            loadUser()
        }
    }
    
    private func loadUser() {
        storageManager.loadUser(from: userStorage) { currentUser in
            userSettings.name = currentUser.name
            userSettings.isRegistered = currentUser.isRegistered
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(UserSettings())
    }
}
