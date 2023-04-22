//
//  SettingMainVC.swift
//  ThuVienAnh
//
//  Created by namnl on 14/04/2023.
//

import UIKit

class SettingMainVC: UIViewController {

    @IBOutlet var biometricsSwitch: UISwitch!
    
    var switchBiometric: Bool? = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switchBiometric = CacheManager.shared.getAccessBiometrics() == 1
        biometricsSwitch.setOn(switchBiometric ?? false, animated: true)
    }
    @IBAction func biometricSwitch(_ sender: UISwitch) {
        let status = sender.isOn
        if status {
            CacheManager.shared.setAccessBiometrics(status: 1 )
        }else {
            CacheManager.shared.setAccessBiometrics(status: 0 )
        }
        
    }
    
    @IBAction func changePasswordPressed(_ sender: UIButton) {
    }
    
    @IBAction func btnChangeAppIconPressed(_ sender: UIButton) {
    }
    
    @IBAction func btnSubportPressed(_ sender: UIButton) {
    }
    
    @IBAction func btnTermPressed(_ sender: UIButton) {
    }
    
    @IBAction func btnPrivacyPressed(_ sender: UIButton) {
    }
    
}
