//
//  ActionMoreVC.swift
//  ThuVienAnh
//
//  Created by namnl on 19/04/2023.
//

import UIKit

class ActionMoreVC: UIViewController {

    var onDelete: ClosureAction?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func goBackPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func deletePressed(_ sender: UIButton) {
        onDelete?()
        dismiss(animated: true)
    }
    
}
