//
//  PasswordMainVC.swift
//  ThuVienAnh
//
//  Created by namnl on 14/04/2023.
//

import UIKit

class PasswordMainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {


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
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setLayout(){
        searchTF.layer.cornerRadius = 10
        btnAdd.layer.cornerRadius = 20
    }
}
extension PasswordMainVC:UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
