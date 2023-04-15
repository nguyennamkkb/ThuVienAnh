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

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PItemCell", for: indexPath) as? PItemCell else {return UITableViewCell()}
        return cell
    }
    
    @IBAction func newScreen(_ sender: UIButton) {
        let vc = CreateNewPasswordVC()
//        let vc = InputPasswordAppVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setLayout(){
        searchTF.layer.cornerRadius = 10
        btnAdd.layer.cornerRadius = 20
    }
}
