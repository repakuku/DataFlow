//
//  UserSettings.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/24/23.
//

import Foundation

final class UserManager: ObservableObject {
    @Published var user = User()
    
    var nameIsValid: Bool {
        user.name.count >= 3
    }
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}
