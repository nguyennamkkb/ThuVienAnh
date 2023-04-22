//
//  CategoryMainVC.swift
//  ThuVienAnh
//
//  Created by namnl on 14/04/2023.
//

import UIKit
import FittedSheets

class CategoryMainVC: BaseVC, UICollectionViewDelegate, UICollectionViewDataSource{
    @IBOutlet var tableView: UITableView!
    var tableData = [PasswordStorage]()
    @IBOutlet var collectionView: UICollectionView!
    var indexCategorySelected: Int = 0
    var collecttionData = [Category]()
    var listDataCategory = [Category]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "CategoryCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "CategoryCell")
        collecttionData = Common.category
        let nib1 = UINib(nibName: "PItemCell", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "PItemCell")
        setLayout()
        getDataByCategory(category: collecttionData.itemAtIndex(index: indexCategorySelected)?.name)
    }
    override func viewDidAppear(_ animated: Bool) {
        updateCollectionView()
        getDataByCategory(category: collecttionData.itemAtIndex(index: indexCategorySelected)?.name)
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
        let item = collecttionData[indexPath.row]
        indexCategorySelected = indexPath.row
        updateCollectionView()
        getDataByCategory(category: item.name)
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
    func getDataByCategory(category: String?){
        guard let value = category else {return}
        let data = Common.passwordStorage
        let filterName = data.filter { $0.category == value }
        let filterStatus = filterName.filter { $0.status == 1 }
        tableData = filterStatus
        updateTableView()
    }
    func updateTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension CategoryMainVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PItemCell", for: indexPath) as? PItemCell else {return UITableViewCell()}
        //        print("tableView",Common.passwordStorage[indexPath.row].toJSON())
        let index = indexPath.row
        let item = tableData[index]
        cell.sendData(item: item )
        cell.actionCopy = {  [weak self] in
            guard let self = self else { return }
            UIPasteboard.general.string =  item.pass
            self.showAlert(message:item.pass)
        }
        cell.actionMore = { [weak self] in
            guard let self = self else { return }
            let vc = ActionMoreVC()
            let sheet = SheetViewController(controller: vc, sizes: [.fixed(220)])
            self.present(sheet, animated: true)
            vc.bindData(item: item)
            vc.onDelete = { [weak self] in
                guard let self = self else { return }
                self.showAlertAction(message: "Delete item: \(item.name ?? "")")
                self.actionOK = { [weak self] in
                    guard let self = self else { return }
                    let newItem = self.tableData[index]
                    newItem.status = 0
                    self.updatePasswordStorage(item: newItem)
                    self.updateTableView()
                }
                
            }
            vc.onShare = {[weak self] in
                guard let self = self else {return}
                let text: String = """
                username: \(item.name ?? "")
                password: \(item.pass ?? "")
                """
                self.shareText(text: text)
            }
            vc.onHeart = {
                [weak self] item in
                guard let self = self else {return}
                self.updatePasswordStorage(item: item)
                self.updateTableView()
            }
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          return 5 // Return the height of the space you want to add between sections
      }
    func updatePasswordStorage(item: PasswordStorage) {
        if let index = Common.passwordStorage.firstIndex(where: { $0.id == item.id }) {
            Common.passwordStorage[index] = item
        }
        Common().updatePasswordStorage()
        
    }
    
}
