//
//  RootView.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/24/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var userSettings: UserSettings
    
    var body: some View {
        Group {
            if userSettings.user.isRegistered {
                ContentView()
            } else {
                LoginView()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(UserSettings())
    }
}
