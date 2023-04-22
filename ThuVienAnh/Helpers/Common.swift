//
//  Common.swift
//  ThuVienAnh
//
//  Created by namnl on 15/04/2023.
//

import Foundation
import UIKit
import ObjectMapper

class Common {
    public static var isLogin: Bool = false
    public static var key_Pass: String = "isPass"
    public static var key_passwordApp: String = "passwordApp"
    public static var key_passwordStorage: String = "passwordStorage"
    public static var key_category: String = "category"
    public static var key_biometrics: String = "biometric"
    public static var key_accessBiometrics: String = "accessBiometrics"
    public static var passwordStorage = [PasswordStorage]()
    public static var category = [Category]()
    public static var accessBiometric: Bool = true
    enum alertStatus {
        case success, error, warning
        func getStatus() -> Int {
            switch self {
            case .success:
                return 1    
            case .error:
                return 2
            case .warning:
                return 3
            }
        }
        func getColor() -> UIColor {
            switch self {
            case .success:
                return UIColor.green
            case .error:
                return UIColor.red
            case .warning:
                return UIColor.yellow
            }
        }
    }
    func checkLogin(){
        if !Common.isLogin {
            
        }
    }
    public func appendPasswordStorage(_ passwordData: PasswordStorage) -> Void {
        Common.passwordStorage.append(passwordData)
        let JSONString = Mapper().toJSONString(Common.passwordStorage, prettyPrint: true)
        CacheManager.shared.setPasswordStorage(value: JSONString)
    }
    public func updatePasswordStorage() -> Void {
        let JSONString = Mapper().toJSONString(Common.passwordStorage, prettyPrint: true)
        CacheManager.shared.setPasswordStorage(value: JSONString)
    }
    
    public func appendCategoty(_ category: Category) -> Void {
        Common.category.append(category)
        let JSONString = Mapper().toJSONString(Common.category, prettyPrint: true)
        CacheManager.shared.setCategory(value: JSONString)
    }
    public func updateCategory() -> Void {
        let JSONString = Mapper().toJSONString(Common.category, prettyPrint: true)
        CacheManager.shared.setCategory(value: JSONString)
    }
    
   
    
    
}
