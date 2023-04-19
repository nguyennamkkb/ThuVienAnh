//
//  PasswordMainVC.swift
//  ThuVienAnh
//
//  Created by namnl on 14/04/2023.
//

import UIKit

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
        cell.sendData(item: Common.passwordStorage[indexPath.row])
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
