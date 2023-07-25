//
//  LoginView.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/24/23.
//

import SwiftUI

struct LoginView: View {
    @State private var name = ""
    @State private var buttonDisabled = true
    @State private var color = Color.red
    @EnvironmentObject private var userSettings: UserSettings
    @AppStorage("user") var userStorage = Data()
    
    private let storageManager = StorageManager.shared
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                    .onChange(of: name) { newValue in
                        if newValue.count > 2 {
                            buttonDisabled = false
                            color = .green
                        } else {
                            buttonDisabled = true
                            color = .red
                        }
                }
                Text("\(name.count)")
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
        if !name.isEmpty {
            userSettings.name = name
            userSettings.isRegistered.toggle()
        }
        saveUser()
    }
    
    private func saveUser() {
        let user = User(name: userSettings.name, isRegistered: userSettings.isRegistered)
        storageManager.save(user) { userData in
            userStorage = userData
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserSettings())
    }
}
