//
//  ReEnterPasswordVC.swift
//  ThuVienAnh
//
//  Created by namnl on 22/04/2023.
//

import UIKit

class ReEnterPasswordVC: BaseVC {

    @IBOutlet var dot1: UIImageView!
    @IBOutlet var dot2: UIImageView!
    @IBOutlet var dot3: UIImageView!
    @IBOutlet var dot4: UIImageView!
    @IBOutlet var messageView: UIView!
    var passwordInputFirst: String? = ""
    var isHideAlert: Int = 1
    var userPassword: String? = ""
    
    var onSuccess: ClosureAction?
    override func viewDidLoad() {
        super.viewDidLoad()
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
        if password != passwordInputFirst {
            
            showMessage()
            resetPassword()
            
        }else {
            onSuccess?()
            dismiss(animated: false)
//            self.wrapRoot(vc: MainVC())
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.hideMessage()
        }
    }
    func setlayout(){
        self.messageView.alpha = 0
        self.messageView.isHidden = true
        messageView.layer.cornerRadius = 10
    }
    
    func bindData(value: String) {
        self.passwordInputFirst = value
    }
}
