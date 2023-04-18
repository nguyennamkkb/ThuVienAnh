//
//  PasswordGenerator.swift
//  ThuVienAnh
//
//  Created by namnl on 15/04/2023.
//

import UIKit

class PasswordGenerator: BaseVC {
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet var inputPasswordView: UIView!
    @IBOutlet var azLabel: UILabel!
    @IBOutlet var a09Label: UILabel!
    @IBOutlet var AZLabel: UILabel!
    @IBOutlet var specialLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var passwordLenght: UILabel!
    
    
    @IBOutlet weak var checkUppercaseLbl: UILabel!
    @IBOutlet weak var checkDigitLbl: UILabel!
    @IBOutlet weak var checkLowerCaseLbl: UILabel!
    @IBOutlet weak var checkSpecialLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        initValue()
        // Do any additional setup after loading the view.
        setLayoutPasswordGenerator()
    }
    func initValue(){
        //✓
        slider.value = 8
        passwordLenght.text = String(Int(slider.value))
        
    }
    func setLayoutPasswordGenerator(){
        
        azLabel.layer.cornerRadius = 10
        a09Label.layer.cornerRadius = 10
        AZLabel.layer.cornerRadius = 10
        specialLabel.layer.cornerRadius = 10
        inputPasswordView.layer.cornerRadius = 10
    }
    @IBAction func btnClosePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sliderChangeed(_ sender: UISlider) {
        passwordLenght.text = String(Int(slider.value))
    }
    
    @IBAction func inputPassword(_ sender: UITextField) {
        let pass = password.text ?? ""
        let ch = pass.components(separatedBy: "")
        resetCheck()
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let checkLetter = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        if checkLetter.evaluate(with: pass) {
            checkUppercaseLbl.text = "✓"
        }
        
        let numberRegEx  = ".*[0-9]+.*"
        let checkNumber = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        if checkNumber.evaluate(with: pass) {
            checkDigitLbl.text = "✓"
        }
        
        let specialLowercaseRegEx  = ".*[a-z]+.*"
        let checkLowercase = NSPredicate(format:"SELF MATCHES %@", specialLowercaseRegEx)
        if checkLowercase.evaluate(with: pass)  {
            checkLowerCaseLbl.text = "✓"
        }
        let specialCharacterRegEx  = ".*[!&^%$#@()/_*+-]+.*"
        let checkSpecial = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        if checkSpecial.evaluate(with: pass)  {
            checkSpecialLbl.text = "✓"
        }
    }
    func resetCheck(){
        checkUppercaseLbl.text = ""
        checkSpecialLbl.text = ""
        checkDigitLbl.text = ""
        checkLowerCaseLbl.text = ""
        
    }
    
}
