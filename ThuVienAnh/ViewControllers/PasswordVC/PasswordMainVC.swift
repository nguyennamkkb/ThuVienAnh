//
//  PasswordMainVC.swift
//  ThuVienAnh
//
//  Created by namnl on 14/04/2023.
//

import UIKit

class PasswordMainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        // Do any additional setup after loading the view.
    }


    @IBAction func newScreen(_ sender: UIButton) {
        let vc = SettingMainVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}