//
//  ContactExpertViewController.swift
//  RoadMate
//
//  Created by Jordy Gonzalez on 4/17/23.
//

import UIKit

class ContactExpertViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        }
    }
    
    var data: [(name: String, description: String)] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        data = Data.default.getExperts()
    }
}

extension ContactExpertViewController: UITableViewDelegate {
    
}

extension ContactExpertViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "default")
        cell.textLabel?.text = data[indexPath.row].name
        cell.detailTextLabel?.text = data[indexPath.row].description
        cell.imageView?.image = UIImage(systemName: "phone.bubble.left")?.withTintColor(.red)
        cell.selectionStyle = .gray
        return cell
    }
}


