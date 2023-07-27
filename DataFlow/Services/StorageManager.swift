//
//  StorageManager.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/25/23.
//

import SwiftUI

final class StorageManager {
    @AppStorage("user") var userStorage = Data()
    
    static let shared = StorageManager()
    
    private init() {}
    
    func saveUser(with userSettings: UserSettings) {
        let user = User(name: userSettings.user.name, isRegistered: userSettings.user.isRegistered)
        if let data = try? JSONEncoder().encode(user) {
            userStorage = data
        }
    }
    
    func loadUser(with userSettings: UserSettings) {
        if let user = try? JSONDecoder().decode(User.self, from: userStorage) {
            userSettings.user.name = user.name
            userSettings.user.isRegistered = user.isRegistered
        }
    }
    
    func deleteUser(with userSettings: UserSettings) {
        userSettings.user.name = ""
        userSettings.user.isRegistered.toggle()
        saveUser(with: userSettings)
    }
}
