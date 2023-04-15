//
//  CreateNewPasswordVC.swift
//  ThuVienAnh
//
//  Created by namnl on 14/04/2023.
//

import UIKit
import FittedSheets
class CreateNewPasswordVC: UIViewController {

    @IBOutlet var titleView: UIView!
    @IBOutlet var accountView: UIView!
    @IBOutlet var passwordView: UIView!
    @IBOutlet var btnSave: UIButton!
    
    @IBOutlet var generatePasswordView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        setLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
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
        self.present(vc, animated: true, completion: nil)
    }
}
extension CreateNewPasswordVC:UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
