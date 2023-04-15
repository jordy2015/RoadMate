//
//  PaymentViewController.swift
//  RoadMate
//
//  Created by Jordy Gonzalez on 14/04/23.
//

import UIKit

class PaymentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelectionDuringEditing = true
        tableView.register(UINib(nibName: "PaymentCell", bundle: nil), forCellReuseIdentifier: "PaymentCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension PaymentViewController: UITableViewDelegate {
    
}

extension PaymentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentCell", for: indexPath) as! PaymentCell
        
        if indexPath.row == 0 {
            cell.setupUI(isVisa: true)
        } else {
            cell.setupUI(isVisa: false)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}

