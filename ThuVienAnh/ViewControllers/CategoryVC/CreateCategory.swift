//
//  CreateCategory.swift
//  ThuVienAnh
//
//  Created by namnl on 20/04/2023.
//

import UIKit

class CreateCategory: BaseVC {

    
    
    @IBOutlet var categoryTF: UITextField!
    var onSuccess: ClosureAction?
    var onFailure: ClosureAction?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnSavePressed(_ sender: UIButton) {
        if let value = categoryTF.text {
            let item = Category()
            item.id =  Date().milliseconds
            item.name = value
            item.status = 1
            Common().appendCategoty(item)
            onSuccess?()
        }
        dismiss(animated: true)
    }
    
    @IBAction func btnBackPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
