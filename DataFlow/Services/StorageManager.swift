//
//  StorageManager.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/25/23.
//

import Foundation
import SwiftUI

final class StorageManager {
    @AppStorage("user") var userStorage = Data()
    
    static let shared = StorageManager()
    
    private init() {}
    
    func saveUser(with userSettings: UserSettings) {
        let user = User(name: userSettings.name, isRegistered: userSettings.isRegistered)
        if let data = try? JSONEncoder().encode(user) {
            userStorage = data
        }
    }
    
    func loadUser(with userSettings: UserSettings) {
        if let user = try? JSONDecoder().decode(User.self, from: userStorage) {
            userSettings.name = user.name
            userSettings.isRegistered = user.isRegistered
        }
    }
}
