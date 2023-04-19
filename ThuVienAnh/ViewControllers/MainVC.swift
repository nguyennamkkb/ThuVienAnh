//
//  MainVC.swift
//  ThuVienAnh
//
//  Created by cvcuong on 13/04/2023.
//

import UIKit
import Kingfisher
class MainVC: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = nil

        //passwordVC
        let passwordVC = PasswordMainVC()
        passwordVC.tabBarItem = UITabBarItem(title: "Passwords", image: UIImage(named: "ic-stack"), tag: 1)
        let passwordNavi = UINavigationController(rootViewController: passwordVC)
        

        
        //categoryVC
        let categoryVC = CategoryMainVC()
        categoryVC.tabBarItem = UITabBarItem(title: "Categories", image: UIImage(named: "ic-note"), tag: 1)
        let categoryNavi = UINavigationController(rootViewController: categoryVC)
        
        //photoVC
        let photoVC = PhotoMainVC()
        photoVC.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(named: "ic-photo"), tag: 1)
        let photoNavi = UINavigationController(rootViewController: photoVC)
        
        //Profile
        let settingVC = SettingMainVC()
        settingVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "ic-setting"), tag: 1)
        let settingNavi = UINavigationController(rootViewController: settingVC)
        
        self.viewControllers = [passwordNavi, categoryNavi,photoNavi, settingNavi]
        setLayout()
    }
    func setLayout(){
        tabBar.tintColor = UIColor(hex: "#00DAC0")
        tabBar.barTintColor =  .white
    }
    
    
}
