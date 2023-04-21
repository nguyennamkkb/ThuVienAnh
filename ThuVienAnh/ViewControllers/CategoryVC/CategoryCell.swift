//
//  CategoryCell.swift
//  ThuVienAnh
//
//  Created by cvcuong on 20/04/2023.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    var item = Category()
    
    @IBOutlet var imageCheck: UIImageView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var countLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func bindData(item: Category) {
        self.item = item
        setValue()
    }
    func setValue(){
        nameLbl.text = item.name
        countLbl.text = "1"
    }
    
}
