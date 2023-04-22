//
//  CreatePasswordVC.swift
//  ThuVienAnh
//
//  Created by namnl on 22/04/2023.
//

import UIKit

class CreatePasswordVC: BaseVC {
    
    @IBOutlet var dot1: UIImageView!
    @IBOutlet var dot2: UIImageView!
    @IBOutlet var dot3: UIImageView!
    @IBOutlet var dot4: UIImageView!
    var isHideAlert: Int = 1
    var userPassword: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        let vc = ReEnterPasswordVC()
        vc.bindData(value: password )

        present(vc, animated: true)
        vc.onSuccess = {[weak self] in
            guard let self = self else {return}
            CacheManager.shared.setBiometrics(status: true)
            CacheManager.shared.setPassword(value: self.userPassword)
            self.wrapRoot(vc: MainVC())
        }
        
        
    }
    
    
}
