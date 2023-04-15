//
//  IntroVC.swift
//  ThuVienAnh
//
//  Created by namnl on 15/04/2023.
//

import UIKit

class IntroVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let mainVC = MainVC()
        let introVC = IntroVC()
        if !CacheManager.shared.isPass() {
            self.navigationController?.pushViewController(introVC, animated: false)
        }
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
