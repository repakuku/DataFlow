//
//  LoginView.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/24/23.
//

import SwiftUI

struct LoginView: View {
    @State private var buttonDisabled = true
    @State private var color = Color.red
    @EnvironmentObject private var userSettings: UserSettings
    
    private let storageManager = StorageManager.shared
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $userSettings.user.name)
                    .multilineTextAlignment(.center)
                    .onChange(of: userSettings.user.name) { newValue in
                        if userSettings.nameIsValid {
                            buttonDisabled = false
                            color = .green
                        } else {
                            buttonDisabled = true
                            color = .red
                        }
                }
                Text("\(userSettings.user.name.count)")
                    .foregroundColor(color)
            }
            Button(action: registerUser) {
                Label("Ok", systemImage: "checkmark.circle")
            }
            .disabled(buttonDisabled)
        }
        .padding()
    }
    
    private func registerUser() {
        userSettings.user.isRegistered = true
        storageManager.saveUser(with: userSettings)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserSettings())
    }
}
