//
//  Common.swift
//  ThuVienAnh
//
//  Created by namnl on 15/04/2023.
//

import Foundation
import UIKit

class Common {
    public static var isLogin: Bool = false
    public static var key_Pass: String = "isPass"
    public static var key_passwordApp: String = "passwordApp"
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
}
