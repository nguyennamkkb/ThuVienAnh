//
//  CreateNewPasswordVC.swift
//  ThuVienAnh
//
//  Created by namnl on 14/04/2023.
//

import UIKit
import FittedSheets

class CreateNewPasswordVC: BaseVC {

    @IBOutlet var titleView: UIView!
    @IBOutlet var accountView: UIView!
    @IBOutlet var passwordView: UIView!
    @IBOutlet var btnSave: UIButton!
    
    @IBOutlet var passwordTF: UITextField!
    
    var dataCallback: String?
    
    var passwordGenerate: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)

        passwordTF.text = LocalStored.passwordGenerate
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
        self.pushVC(vc: vc)
        
    }
    
    @IBAction func btnSavePressed(_ sender: UIButton) {
        showAlert(message: "Thông báo!")
    }

}
