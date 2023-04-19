//
//  PasswordMainVC.swift
//  ThuVienAnh
//
//  Created by namnl on 14/04/2023.
//

import UIKit
import FittedSheets


class PasswordMainVC: BaseVC, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var searchTF: UIView!
    @IBOutlet var btnAdd: UIButton!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        setLayout()
        let nib = UINib(nibName: "PItemCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PItemCell")
        // Do any additional setup after loading the view.
        //        print(Common.passwordStorage.toJSON())
    }
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Common.passwordStorage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PItemCell", for: indexPath) as? PItemCell else {return UITableViewCell()}
        //        print("tableView",Common.passwordStorage[indexPath.row].toJSON())
        let item = Common.passwordStorage[indexPath.row]
        cell.sendData(item: item )
        cell.actionCopy = {  [weak self] in
            guard let self = self else { return }
            UIPasteboard.general.string =  item.pass
            self.showAlert(message:item.pass)
        }
        
        cell.actionMore = { [weak self] in
            guard self != nil else { return }
            let sheet = SheetViewController(controller: ActionMoreVC(), sizes: [.fixed(220)])

            self?.present(sheet, animated: true)
            
        }
        return cell
    }
    
    @IBAction func btnAddPressed(_ sender: UIButton) {
        let vc = CreateNewPasswordVC()
        //        let vc = InputPasswordAppVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setLayout(){
        searchTF.layer.cornerRadius = 10
    }
}
