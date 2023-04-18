//
//  Utility.swift
//  ThuVienAnh
//
//  Created by namnl on 18/04/2023.
//

import Foundation
import UIKit

public class Utility {
    class func gotoMainVC() {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let nav = UINavigationController(rootViewController: MainVC())
        appdelegate.window?.rootViewController = nav
        appdelegate.window?.makeKeyAndVisible()
    }
}
