//
//  PasswordGenerator.swift
//  ThuVienAnh
//
//  Created by namnl on 15/04/2023.
//

import UIKit

class PasswordGenerator: BaseVC {

    
    @IBOutlet var inputPasswordView: UIView!
    @IBOutlet var azLabel: UILabel!
    @IBOutlet var a09Label: UILabel!
    @IBOutlet var AZLabel: UILabel!
    @IBOutlet var specialLabel: UILabel!
    
    
    
      
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        // Do any additional setup after loading the view.
        setLayoutPasswordGenerator()
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
    
}
