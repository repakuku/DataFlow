//
//  ContentView.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/24/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    private let storageManager = StorageManager.shared
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)!")
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
        storageManager.clear(userManager: userManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}
