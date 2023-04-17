//
//  BaseVC.swift
//  ThuVienAnh
//
//  Created by namnl on 15/04/2023.
//

import UIKit

class BaseVC: UIViewController {
    
    let alertView = UIView()
    var messageLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayoutAlert()
//        alertView.isHidden = true
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//        UIView.animate(withDuration: 0.3) {
//            self.alertView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.alertViewHeight)
//        }
    }
    func setLayoutAlert(){
        alertView.layer.zPosition = 999
        view.addSubview(alertView)
        alertView.backgroundColor = UIColor(hexString: "#0A0A0A")
        alertView.frame = CGRect(x: 40, y: -50, width: self.view.frame.width - 80, height: 44)
        alertView.layer.cornerRadius = 15
        messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 80, height: 44))
        messageLabel.text = ""
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.textColor = .white
        alertView.addSubview(messageLabel)
        alertView.layer.shadowColor = UIColor.gray.cgColor
        alertView.layer.shadowOpacity = 0.2
        alertView.layer.shadowOffset = .zero
        alertView.layer.shadowRadius = 10
        alertView.layer.borderColor = UIColor.gray.cgColor
        alertView.layer.borderWidth = 1
        
    }
    func showAlert(message: String?){
        self.messageLabel.text  = message ?? ""
        UIView.animate(withDuration: 0.3) {
            self.alertView.frame = CGRect(x: 40, y: 50, width: self.view.frame.width - 80, height: 44)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.hideAlert()
        }
    }
    func hideAlert(){
        UIView.animate(withDuration: 0.3) {
            self.alertView.frame = CGRect(x: 40, y: -50, width: self.view.frame.width - 80, height: 44)
        }
    }
    
}
extension BaseVC:UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
