//
//  LoginView.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/24/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var userSettings: UserSettings
    @State private var buttonDisabled = true
    
    private let storageManager = StorageManager.shared
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $userSettings.user.name)
                    .multilineTextAlignment(.center)
                Text("\(userSettings.user.name.count)")
                    .foregroundColor(userSettings.nameIsValid ? .green : .red)
            }
            Button(action: registerUser) {
                Label("Ok", systemImage: "checkmark.circle")
            }
            .disabled(!userSettings.nameIsValid)
        }
        .padding()
    }
    
    private func registerUser() {
        userSettings.user.isRegistered.toggle()
        storageManager.saveUser(with: userSettings)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserSettings())
    }
}
