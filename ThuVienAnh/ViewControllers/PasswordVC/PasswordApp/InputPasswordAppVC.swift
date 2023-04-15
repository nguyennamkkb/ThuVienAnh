//
//  InputPasswordAppVC.swift
//  ThuVienAnh
//
//  Created by namnl on 15/04/2023.
//

import UIKit
import LocalAuthentication
class InputPasswordAppVC: BaseVC {

    @IBOutlet var dot1: UIImageView!
    @IBOutlet var dot2: UIImageView!
    @IBOutlet var dot3: UIImageView!
    @IBOutlet var dot4: UIImageView!
    @IBOutlet var alertView: UIView!
    let localAuthenticationContext = LAContext()
    var isHideAlert: Int = 1
    var userPassword: String? = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        CacheManager.shared.setPassword(value: "1234")
        setlayout()
    }
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        guard let userPasswordCnt = userPassword?.count  else {return}
        if userPasswordCnt >= 0, userPasswordCnt <= 3 {
            userPassword! += sender.titleLabel?.text ?? ""
            updateDotLight(length: userPassword?.count ?? 0)
        }


    }
    @IBAction func btnDeletePressed(_ sender: UIButton) {
        guard let userPasswordCnt = userPassword?.count  else {return}
        if userPasswordCnt > 0, userPasswordCnt <= 4 {
            //xoa
            let quote = userPassword!
            let substring = quote.dropLast(1)
            userPassword! = String(substring)
            updateDotLight(length: userPassword?.count ?? 0)
        }
        
    }
    func updateDotLight(length: Int) {
        if length == 0 {
            dot1.image = UIImage(named: "ic-dot")
            dot2.image = UIImage(named: "ic-dot")
            dot3.image = UIImage(named: "ic-dot")
            dot4.image = UIImage(named: "ic-dot")
        }
        if length == 1 {
            dot1.image = UIImage(named: "ic-dot-active")
            dot2.image = UIImage(named: "ic-dot")
            dot3.image = UIImage(named: "ic-dot")
            dot4.image = UIImage(named: "ic-dot")
        }
        if length == 2 {
            dot1.image = UIImage(named: "ic-dot-active")
            dot2.image = UIImage(named: "ic-dot-active")
            dot3.image = UIImage(named: "ic-dot")
            dot4.image = UIImage(named: "ic-dot")
        }
        if length == 3 {
            dot1.image = UIImage(named: "ic-dot-active")
            dot2.image = UIImage(named: "ic-dot-active")
            dot3.image = UIImage(named: "ic-dot-active")
            dot4.image = UIImage(named: "ic-dot")
        }
        if length == 4 {
            dot1.image = UIImage(named: "ic-dot-active")
            dot2.image = UIImage(named: "ic-dot-active")
            dot3.image = UIImage(named: "ic-dot-active")
            dot4.image = UIImage(named: "ic-dot-active")
            checkPassword()
        }
    }
    func checkPassword() {
        guard let password = userPassword else {return}
        print("password: \(password)")
        print("cachePass: \(CacheManager.shared.getPassword())")
        if password != CacheManager.shared.getPassword() {
            dot1.image = UIImage(named: "ic-dot-red")
            dot2.image = UIImage(named: "ic-dot-red")
            dot3.image = UIImage(named: "ic-dot-red")
            dot4.image = UIImage(named: "ic-dot-red")
            showAlert()
            
        }else {
            print("pass")
        }
        
    }
    func hideAlert(){
        UIView.animate(withDuration: 0.2) {
            self.alertView.alpha = 0
            self.alertView.isHidden = true
        }
        
    }
    func showAlert(){
        UIView.animate(withDuration: 0.2) {
            self.alertView.alpha = 1
            self.alertView.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.hideAlert()
        }
    }
    func setlayout(){
        self.alertView.alpha = 0
        self.alertView.isHidden = true
        alertView.layer.cornerRadius = 10
    }
    
    @IBAction func btnFaceIdPressed(_ sender: UIButton) {
        let context = LAContext()
            var error: NSError?
            
            // Check if the device supports Face ID or Touch ID
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Authenticate using Face ID"
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                    DispatchQueue.main.async {
                        if success {
                           print("thanh cong")
                        } else {
                            print("That bai")
                        }
                    }
                }
            } else {
                // Biometric authentication not supported
            }
    }
    
}
