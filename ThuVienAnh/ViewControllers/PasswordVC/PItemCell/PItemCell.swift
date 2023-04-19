//
//  PItemCell.swift
//  ThuVienAnh
//
//  Created by namnl on 14/04/2023.
//

import UIKit

class PItemCell: UITableViewCell {

    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var passwordLbl: UILabel!
    var item = PasswordStorage()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func sendData(item: PasswordStorage) {
        self.dateLbl.text = item.date
        self.nameLbl.text = item.name
        self.passwordLbl.text = item.pass
        self.item = item
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func btnMorePressed(_ sender: UIButton) {
    }
    @IBAction func btnCopyPreessed(_ sender: UIButton) {
        UIPasteboard.general.string = self.item.pass
    }
}
