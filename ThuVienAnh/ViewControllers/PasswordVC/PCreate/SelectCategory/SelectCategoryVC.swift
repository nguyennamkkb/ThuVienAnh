//
//  SelectCategoryVC.swift
//  ThuVienAnh
//
//  Created by namnl on 21/04/2023.
//

import UIKit

class SelectCategoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var onSelected: ClosureCustom<Category>?
    var tableData = [Category]()
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "SelectCategoryCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "SelectCategoryCell")
        tableData = Common.category
        updateTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectCategoryCell", for: indexPath) as? SelectCategoryCell else {return UITableViewCell()}
        let item = tableData[indexPath.row]
        cell.name.text = item.name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = tableData[indexPath.row]
        onSelected?(item)
        dismiss(animated: true)
    }
    

    func updateTableView(){
        tableData = Common.category
        self.getDataStatusShow()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func getDataStatusShow(){
        let filter = tableData.filter { $0.status == 1 }
        tableData = filter
    }
}
