//
//  StorageManager.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/25/23.
//

import SwiftUI

final class StorageManager {
    
    static let shared = StorageManager()
    
    @AppStorage("userData") private var userData: Data?

    private init() {}
    
    func save(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func fetchUser() -> User {
        guard let userData else { return User() }
        let user = try? JSONDecoder().decode(User.self, from: userData)
        guard let user = user else { return User()}
        return user
    }
    
    func clear(userManager: UserManager) {
        userManager.user.name = ""
        userManager.user.isRegistered.toggle()
        userData = nil
    }
}
