//
//  StorageManager.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/25/23.
//

import Foundation
import SwiftUI

final class StorageManager {
    @AppStorage("userName") var userName = ""
    @AppStorage("userIsRegistered") var userIsRegistered = false
    
    static let shared = StorageManager()
    
    private init() {}
    
    func save(_ user: UserSettings) {
        userName = user.name
        userIsRegistered = user.isRegistered
    }
    
    func load(_ user: UserSettings) {
        user.name = userName
        user.isRegistered = userIsRegistered
    }
}
