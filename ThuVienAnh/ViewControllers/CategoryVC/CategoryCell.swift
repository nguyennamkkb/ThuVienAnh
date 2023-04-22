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
        countLbl.text = "\(getCountCategory(name: item.name))"
    }
    func getCountCategory(name: String!) -> Int{
        guard let value = name else {return 0}
        let data = Common.passwordStorage
        let filterName = data.filter { $0.category == value }
        let filterStatus = filterName.filter { $0.status == 1 }
        return filterStatus.count
    }
    
}
