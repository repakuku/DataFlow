//
//  ContentView.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/24/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userSettings: UserSettings
    @AppStorage("user") var userStorage = Data()
    
    private let storageManager = StorageManager.shared
    
    var body: some View {
        VStack {
            Text("Hi, \(userSettings.name)!")
                .font(.largeTitle)
                .padding(.top, 50)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            ButtonView(action: timer.startTimer, title: timer.buttonTitle, color: .red)
            Spacer()
            ButtonView(action: logout, title: "LogOut", color: .blue)
        }
        .padding()
    }
    
    private func logout() {
        userSettings.isRegistered.toggle()
        deleteUser()
    }
    
    private func deleteUser() {
        storageManager.save(User()) { userData in
            userStorage = userData
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserSettings())
    }
}
