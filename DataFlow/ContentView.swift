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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserSettings())
    }
}

struct ButtonView: View {
    let action: () -> Void
    let title: String
    let color: Color
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Text(title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 60)
            .background(color)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.black, lineWidth: 4)
            )
        }
    }
}
