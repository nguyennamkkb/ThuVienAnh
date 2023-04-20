//
//  ActionMoreVC.swift
//  ThuVienAnh
//
//  Created by namnl on 19/04/2023.
//

import UIKit

class ActionMoreVC: UIViewController {

    @IBOutlet var btnHeart: UIButton!
    var onDelete: ClosureAction?
    var onShare: ClosureAction?
    var onHeart: ClosureCustom<PasswordStorage>?
    var item = PasswordStorage()
    var isHeart: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setIconHeart()
//        btnHeart.setImage(UIImage(named: "heart.fill"), for: .normal)
//        btnHeart.tintColor = UIColor(hex: "#00DAC0")
    }


    @IBAction func goBackPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func deletePressed(_ sender: UIButton) {
        dismiss(animated: true)
        onDelete?()
        
    }
    func bindData(item: PasswordStorage){
        self.item = item
        isHeart = self.item.heart == 1
        setIconHeart()

    }
    
    @IBAction func btnSharePressed(_ sender: UIButton) {
        dismiss(animated: false)
        onShare?()
    }
    @IBAction func btnHeartPressed(_ sender: UIButton) {
        isHeart = !isHeart
        if isHeart {
            item.heart = 1
        }else {
            item.heart = 0
        }
        onHeart?(item)
        dismiss(animated: false)
    }
    func setIconHeart(){
        if isHeart == true {
            btnHeart.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            btnHeart.tintColor = UIColor(hex: "#00DAC0")
        }else {
            btnHeart.setImage(UIImage(systemName: "heart"), for: .normal)
            btnHeart.tintColor = UIColor.white
        }
    }
    
}
