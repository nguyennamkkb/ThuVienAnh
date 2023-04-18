//
//  Utility.swift
//  ThuVienAnh
//
//  Created by namnl on 18/04/2023.
//

import Foundation
import UIKit

public class Utility {
    @objc static func topViewController() -> UIViewController{
        return self.topViewControllerWithRootViewController(UIApplication.shared.keyWindow?.rootViewController ?? UIViewController())
    }
    
    static func topViewControllerWithRootViewController(_ rootViewController: UIViewController) -> UIViewController{
        if rootViewController is UITabBarController {
            let tabbar = rootViewController as! UITabBarController
            return self.topViewControllerWithRootViewController(tabbar.selectedViewController ?? UIViewController())
        }else if rootViewController is UINavigationController{
            let navi = rootViewController as! UINavigationController
            return self.topViewControllerWithRootViewController(navi.visibleViewController  ?? UIViewController())
        }else if let presentVC = rootViewController.presentedViewController{
            return self.topViewControllerWithRootViewController(presentVC)
        }else {
            return rootViewController
        }
    }
}
