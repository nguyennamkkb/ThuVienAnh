//
//  BaseVC.swift
//  ThuVienAnh
//
//  Created by namnl on 15/04/2023.
//

import UIKit

class BaseVC: UIViewController {
    
    let alertView = UIView()
    
    // Height of the container view
    var alertViewHeight: CGFloat = -50
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
        let backgroundView = UIView(frame: view.bounds)
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.addSubview(backgroundView)
        
        // Add container view
        alertView.frame = CGRect(x: 20, y: -100, width: view.frame.width - 40, height: 50)
        alertView.backgroundColor = UIColor.white
        view.addSubview(alertView)
        
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 30, width: alertView.frame.width, height: 50))
        messageLabel.text = "Alert message goes here"
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        alertView.addSubview(messageLabel)
        
    }
    func dismissAlert() {
        // Animate container view frame to slide back down offscreen
        UIView.animate(withDuration: 0.3, animations: {
            self.alertView.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: self.alertViewHeight)
        }) { (_) in
            // Dismiss the view controller when animation is complete
            self.dismiss(animated: false, completion: nil)
        }
    }
    func showAlert() {
        alertView.frame.origin.y = -alertView.frame.height
        UIView.animate(withDuration: 0.5) {
            self.alertView.frame.origin.y = 0
        }
    }
    
}
extension BaseVC:UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
