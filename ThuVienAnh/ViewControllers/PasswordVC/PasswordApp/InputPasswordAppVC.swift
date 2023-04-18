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
    @IBOutlet var messageView: UIView!
    let localAuthenticationContext = LAContext()
    var isHideAlert: Int = 1
    var userPassword: String? = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        CacheManager.shared.setPassword(value: "1234")
        setlayout()
    }
    func resetPassword(){
        userPassword = ""
        updateDotLight(length: 0)
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
        let dotArray = [dot1, dot2, dot3, dot4]
        for index in dotArray.indices {
//            print(index)
            if index < length {
                dotArray[index]!.image = UIImage(named: "ic-dot-active")
            }else {
                dotArray[index]!.image = UIImage(named: "ic-dot")
            }
            
        }
        if length == 4 {
            checkPassword()
        }
    }
    func checkPassword() {
        guard let password = userPassword else {return}
        if password != CacheManager.shared.getPassword() {

            showMessage()
            resetPassword()
            
        }else {
            self.wrapRoot(vc: MainVC())
        }
        
    }
    func hideMessage(){
        UIView.animate(withDuration: 0.2) {
            self.messageView.alpha = 0
            self.messageView.isHidden = true
        }
        
    }
    func showMessage(){
        UIView.animate(withDuration: 0.2) {
            self.messageView.alpha = 1
            self.messageView.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.hideMessage()
        }
    }
    func setlayout(){
        self.messageView.alpha = 0
        self.messageView.isHidden = true
        messageView.layer.cornerRadius = 10
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
                        Common.isLogin = true
                        CacheManager.shared.setPass(true)
                        self.wrapRoot(vc: MainVC())
                    } else {
                        print("That bai")
                        CacheManager.shared.setPass(false)
                    }
                }
            }
        } else {
            // Biometric authentication not supported
        }
    }
    
}
