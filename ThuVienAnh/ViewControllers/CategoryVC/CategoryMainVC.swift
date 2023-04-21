//
//  CategoryMainVC.swift
//  ThuVienAnh
//
//  Created by namnl on 14/04/2023.
//

import UIKit
import FittedSheets

class CategoryMainVC: BaseVC, UICollectionViewDelegate, UICollectionViewDataSource {

 

    @IBOutlet var collectionView: UICollectionView!
    var indexCategorySelected: Int = -1
    var collecttionData = [Category]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "CategoryCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "CategoryCell")
        collecttionData = Common.category
        setLayout()
        updateCollectionView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collecttionData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else {return UICollectionViewCell()}
            if indexCategorySelected == indexPath.row {
                cell.imageCheck.isHidden =  false
                cell.imageCheck.image = UIImage(named: "ic-checked")
            }else {
                cell.imageCheck.isHidden =  true
            }
        let item = collecttionData[indexPath.row]
        cell.bindData(item: item)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        indexCategorySelected = indexPath.row
        updateCollectionView()
        return true
    }
    func setLayout(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 20
        layout.itemSize.width = 90
        layout.itemSize.height = 120
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    @IBAction func btnAddCategory(_ sender: UIButton) {
        let vc =  CreateCategory()
        let sheet = SheetViewController(controller: vc, sizes: [.fixed(220)])
        self.present(sheet, animated: true)
        vc.onSuccess = {[weak self] in
            guard let self = self else {return}
            self.showAlert(message: "Success!")
            self.updateCollectionView()
        }
    }
    
    func updateCollectionView(){
        collecttionData = Common.category
        self.getDataStatusShow()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    func getDataStatusShow(){
        let filter = collecttionData.filter { $0.status == 1 }
        collecttionData = filter
    }

}
