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
    
    @IBOutlet var btnSelectCategory: UIButton!
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
        btnSelectCategory.layer.cornerRadius = 5
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
        storeData()
        self.navigationController?.popViewController(animated: true)
        
    }
    func storeData(){
        let passwordData: PasswordStorage = PasswordStorage()
        if usernameTF.text != "", passwordTF.text != "", titleTF.text != "" {
            passwordData.id = Date().milliseconds
            passwordData.date = "19/04/2023"
            passwordData.title = titleTF.text
            passwordData.name = btnSelectCategory.titleLabel?.text ?? ""
            passwordData.pass = passwordTF.text
            passwordData.category = "Websites"
            passwordData.status = 1
            passwordData.heart = 0
            Common().appendPasswordStorage(passwordData)
        }
    }
    
    @IBAction func bntSelectCategoryPressed(_ sender: UIButton) {
        let vc = SelectCategoryVC()
        let sheet = SheetViewController(controller: vc, sizes: [.fixed(200)])
        self.present(sheet, animated: true)
        vc.onSelected = {[weak self] item in
            guard let self = self else {return}
//            print("item \(item.toJSON())")
            self.btnSelectCategory.setTitle(item.name, for: .normal)
            
        }
    }
}
