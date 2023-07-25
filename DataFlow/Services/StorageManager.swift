//
//  StorageManager.swift
//  DataFlow
//
//  Created by Алексей Турулин on 7/25/23.
//

import Foundation
import SwiftUI
import Combine

final class StorageManager {
    static let shared = StorageManager()
    
    @AppStorage("user") var userStorage = Data()
    
    private init() {}
    
    func save(_ user: User, completion: (Data) -> Void) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(user) {
            completion(data)
        }
    }
    
    func loadUser(from data: Data, completion: (User) -> Void) {
        let decoder = JSONDecoder()
        if let user = try? decoder.decode(User.self, from: data) {
            completion(user)
        }
    }
}
