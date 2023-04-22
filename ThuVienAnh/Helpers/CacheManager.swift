//
//  CacheManager.swift
//  ThuVienAnh
//
//  Created by namnl on 15/04/2023.
//

import Foundation

class CacheManager {
    public static let shared = CacheManager()
    
    let defaults = UserDefaults.standard
    
    func isPass() -> Bool {
        return defaults.bool(forKey: Common.key_Pass)
    }
    func setPass(_ value: Bool) {
        return defaults.setValue(value, forKey: Common.key_Pass)
    }
    
    func getPassword() -> String {
        return defaults.string(forKey: Common.key_passwordApp) ?? ""
    }
    func setPassword(value: String?) {
        return defaults.setValue(value ?? "", forKey: Common.key_passwordApp)
    }
    
    func getPasswordStorage() -> String {
        return defaults.string(forKey: Common.key_passwordStorage) ?? ""
    }
    func setPasswordStorage(value: String?) {
        return defaults.setValue(value ?? "", forKey: Common.key_passwordStorage)
    }
    
    func getCategory() -> String {
        return defaults.string(forKey: Common.key_category) ?? ""
    }
    func setCategory(value: String?) {
        return defaults.setValue(value ?? "", forKey: Common.key_category)
    }
    
    func getBiometrics() -> Bool {
        return defaults.bool(forKey: Common.key_biometrics)
    }
    func setBiometrics(status: Bool) {
        return defaults.setValue(status, forKey: Common.key_biometrics)
    }
    
    func getAccessBiometrics() -> Int {
        return defaults.integer(forKey: Common.key_accessBiometrics)
    }
    func setAccessBiometrics(status: Int) {
        return defaults.setValue(status, forKey: Common.key_accessBiometrics)
    }
}
