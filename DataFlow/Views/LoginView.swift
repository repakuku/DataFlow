//
//  LoginView.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/24/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var userManager: UserManager
    private let storageManager = StorageManager.shared
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $userManager.user.name)
                    .multilineTextAlignment(.center)
                Text(userManager.user.name.count.formatted())
                    .foregroundColor(userManager.nameIsValid ? .green : .red)
            }
            Button(action: registerUser) {
                Label("Ok", systemImage: "checkmark.circle")
            }
            .disabled(!userManager.nameIsValid)
        }
        .padding()
    }
    
    private func registerUser() {
        userManager.user.isRegistered.toggle()
        storageManager.save(user: userManager.user)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserManager())
    }
}
