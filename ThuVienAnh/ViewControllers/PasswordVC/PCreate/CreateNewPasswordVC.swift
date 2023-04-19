//
//  CreateNewPasswordVC.swift
//  ThuVienAnh
//
//  Created by namnl on 14/04/2023.
//

import UIKit
import FittedSheets
import ObjectMapper

class CreateNewPasswordVC: BaseVC {
    @IBOutlet var titleView: UIView!
    @IBOutlet var accountView: UIView!
    @IBOutlet var passwordView: UIView!
    @IBOutlet var btnSave: UIButton!
    
    @IBOutlet var titleTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var usernameTF: UITextField!
    
    var dataCallback: String?

    var passwordGenerate: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        setLayout()
       
    }
    @IBAction func backToPasswordMainPressed(_ sender: UIButton) { 
        self.navigationController?.popViewController(animated: true)
    }
    func setLayout(){
        titleView.layer.cornerRadius = 10
        accountView.layer.cornerRadius = 10
        passwordView.layer.cornerRadius = 10
        btnSave.layer.cornerRadius = 10

        
    }
    
    @IBAction func generatePasswordPressed(_ sender: UIButton) {
    
        let vc = PasswordGenerator()
        vc.passwordCallback = {
            data in
            self.passwordTF.text  = data
        }
        self.present(vc, animated: true)
        
    }
    
    @IBAction func btnSavePressed(_ sender: UIButton) {
        let passwordData: PasswordStorage = PasswordStorage()
        if usernameTF.text != "", passwordTF.text != "", titleTF.text != "" {
            passwordData.id = Date().milliseconds
            passwordData.date = "19/04/2023"
            passwordData.title = titleTF.text
            passwordData.name = usernameTF.text
            passwordData.pass = passwordTF.text
            passwordData.category = "Websites"
            passwordData.status = 1
            Common().updatePasswordStorage(passwordData)
            showAlert(message: "Thành công!")
        }
        
    }

}
