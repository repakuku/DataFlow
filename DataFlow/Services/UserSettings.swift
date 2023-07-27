//
//  UserSettings.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/24/23.
//

import Foundation

final class UserSettings: ObservableObject {
    @Published var user = User(name: "", isRegistered: false)
    
    var nameIsValid: Bool {
        user.name.count >= 3
    }
}
