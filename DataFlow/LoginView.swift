//
//  LoginView.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/24/23.
//

import SwiftUI

struct LoginView: View {
    @State private var name = ""
    @EnvironmentObject private var userSettings: UserSettings
    
    var body: some View {
        VStack {
            TextField("Enter your name...", text: $name)
                .multilineTextAlignment(.center)
            Button(action: registerUser) {
                Label("Ok", systemImage: "checkmark.circle")
            }
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            userSettings.name = name
            userSettings.isRegistered.toggle()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserSettings())
    }
}
