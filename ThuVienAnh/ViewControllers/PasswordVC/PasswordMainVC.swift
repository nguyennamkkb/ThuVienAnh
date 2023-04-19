//
//  PasswordMainVC.swift
//  ThuVienAnh
//
//  Created by namnl on 14/04/2023.
//

import UIKit
import FittedSheets


class PasswordMainVC: BaseVC, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var keySearch: UITextField!
    @IBOutlet var searchTF: UIView!
    @IBOutlet var btnAdd: UIButton!
    @IBOutlet var tableView: UITableView!
    var tableData = [PasswordStorage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableData = Common.passwordStorage
        tableView.dataSource = self
        tableView.delegate = self
        setLayout()
        let nib = UINib(nibName: "PItemCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PItemCell")
        
        getDataStatusShow()
//        print(tableData.toJSON())
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tableData = Common.passwordStorage
        getDataStatusShow()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    @IBAction func searchNameChanged(_ sender: UITextField) {
        let value = keySearch.text ?? ""
        //        let arrayResults = [PasswordStorage]()
        if value == "" {
            tableData = Common.passwordStorage
            
        }else {
            let filter = tableData.filter { $0.name?.contains(value) ?? false }
            tableData = filter
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        
    }

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
            guard self != nil else { return }
            let vc = ActionMoreVC()
            let sheet = SheetViewController(controller: vc, sizes: [.fixed(220)])
            self?.present(sheet, animated: true)
            vc.onDelete = {
                [weak self] in
                let newItem = self?.tableData[index]
                newItem?.status = 0
                Common.passwordStorage[index] = newItem ?? PasswordStorage()
                Common().updatePasswordStorage()
                self?.tableData = Common.passwordStorage
                
                print("newItem \(Common.passwordStorage.toJSON())")
                DispatchQueue.main.async {
                    self?.getDataStatusShow()
                    self?.tableView.reloadData()
                }
            }
        }
        
        return cell
    }
    
    
    @IBAction func btnAddPressed(_ sender: UIButton) {
        let vc = CreateNewPasswordVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setLayout(){
        searchTF.layer.cornerRadius = 10
    }
    func getDataStatusShow(){
        let filter = tableData.filter { $0.status == 1 }
        tableData = filter
    }
}
