//
//  CustomsAlertVC.swift
//  ThuVienAnh
//
//  Created by namnl on 16/04/2023.
//

import UIKit

class CustomsAlertVC: UIViewController {
    let cAlert: UIView = UIView()
    var messageLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        // Do any additional setup after loading the view.
    }
    func setLayout(){
        view.addSubview(cAlert)
        cAlert.backgroundColor = UIColor(hexString: "#0A0A0A")
        cAlert.frame = CGRect(x: 40, y: -50, width: self.view.frame.width - 80, height: 44)
        cAlert.layer.cornerRadius = 15
        messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 80, height: 44))
        messageLabel.text = ""
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.textColor = .white
        cAlert.addSubview(messageLabel)
    }
    
    @IBAction func show(_ sender: Any) {
      aShow(message: "Nam oi")
    }
    func aShow(message: String?){
        self.messageLabel.text  = message ?? ""
        UIView.animate(withDuration: 0.3) {
            self.cAlert.frame = CGRect(x: 40, y: 50, width: self.view.frame.width - 80, height: 44)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.ahide()
        }
    }
    func ahide(){
        UIView.animate(withDuration: 0.3) {
            self.cAlert.frame = CGRect(x: 40, y: -50, width: self.view.frame.width - 80, height: 44)
        }
    }
    
}
