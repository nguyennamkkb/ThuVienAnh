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
    var category = Category()
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
        if usernameTF.text != "", passwordTF.text != "", titleTF.text != "", category.name != nil {
            passwordData.id = Date().milliseconds
            passwordData.date = "\(Date().milliseconds)"
            passwordData.title = titleTF.text
            passwordData.name = usernameTF.text
            passwordData.pass = passwordTF.text
            passwordData.category = category.name
            passwordData.status = 1
            passwordData.heart = 0
            Common().appendPasswordStorage(passwordData)
        }
    }
    
    @IBAction func bntSelectCategoryPressed(_ sender: UIButton) {
        let vc = SelectCategoryVC()
        let sheet = SheetViewController(controller: vc, sizes: [.fixed(300)])
        vc.view.backgroundColor = .black
        sheet.cornerRadius = 0
        sheet.contentBackgroundColor = .black
        sheet.pullBarBackgroundColor = .black
        self.present(sheet, animated: true)
        vc.onSelected = {[weak self] item in
            guard let self = self else {return}
//            print("item \(item.toJSON())")
            self.category = item
            self.btnSelectCategory.setTitle(item.name, for: .normal)
        }
    }
}
extension UIViewController {
    public func showSheet(controller: UIViewController, sizes: [SheetSize]) {
        let controller = SheetViewController(controller:controller, sizes: sizes)
        controller.overlayColor = UIColor.black.withAlphaComponent(0.4)
        controller.cornerRadius = 16
        self.present(controller, animated: false, completion: nil)
    }
    
    public var sheetViewController: SheetViewController? {
        var parent = self.parent
        while let currentParent = parent {
            if let sheetViewController = currentParent as? SheetViewController {
                return sheetViewController
            } else {
                parent = currentParent.parent
            }
        }
        return nil
    }
}
