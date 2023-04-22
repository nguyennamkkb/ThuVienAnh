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
    
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tableData = Common.passwordStorage
        getDataStatusShow()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    @IBAction func searchNameChanged(_ sender: UITextField) {
        tableData = Common.passwordStorage
        let value = keySearch.text ?? ""
        if value == "" {
            tableData = Common.passwordStorage
        }else {
            let filter = tableData.filter { $0.title?.contains(value) ?? false }
            tableData = filter
        }
        getDataStatusShow()
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
                    self.updateTable()
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
                self.updateTable()
//                print(self.tableData.toJSONString())
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
    func updatePasswordStorage(item: PasswordStorage) {
        if let index = Common.passwordStorage.firstIndex(where: { $0.id == item.id }) {
            Common.passwordStorage[index] = item
        }
        Common().updatePasswordStorage()
        
    }
    func updateTable(){
        self.tableData = Common.passwordStorage
        self.getDataStatusShow()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
