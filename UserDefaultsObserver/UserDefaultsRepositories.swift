//
//  UserDefaultsRepositories.swift
//  UserDefaultsObserver
//
//  Created by Hiromu Nakano on 2020/03/18.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation

struct UserDefaultsRepositories {
    static let shared = UserDefaultsRepositories()

    private init() {}

    private let instance = UserDefaults.standard
    private let key = "isLogin"
    private let keyForSettings = "isLoginForSettings"

    func get() -> Bool {
        return instance.bool(forKey: key)
    }

    func set(_ newValue: Bool) {
        instance.set(newValue, forKey: key)
    }

    func getForSettings() -> Bool {
        return instance.bool(forKey: keyForSettings)
    }

    func setForSettings(_ newValue: Bool) {
        instance.set(newValue, forKey: keyForSettings)
    }
}

extension UserDefaults {
    @objc dynamic var isLoginForSettings: Bool {
        return UserDefaultsRepositories.shared.get()
    }
}
