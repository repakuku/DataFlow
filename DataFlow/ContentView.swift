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
            ButtonView(timer: timer)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserSettings())
    }
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: timer.startTimer) {
            ZStack {
                Text("\(timer.buttonTitle)")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 60)
            .background(.red)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.black, lineWidth: 4)
            )
        }
    }
}
