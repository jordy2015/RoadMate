//
//  ServicesViewController.swift
//  RoadMate
//
//  Created by Jordy Gonzalez on 4/15/23.
//

import UIKit

class ServicesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        }
    }
    
    var serviceType: SupportType?
    var data: [ServiceDataSource] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        if let type = serviceType {
            switch type {
            case .car:
                data = Data.default.getCarServices()
            case .moto:
                break
            default:
                break
            }
        }
    }
}

extension ServicesViewController: UITableViewDelegate {
    
}

extension ServicesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "default")
        let content = data[indexPath.section].content
        cell.textLabel?.text = content[indexPath.row].serviceName
        cell.detailTextLabel?.text = content[indexPath.row].descripcion
        cell.imageView?.image = UIImage(systemName: content[indexPath.row].imageName)?.withTintColor(.red)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].sectionName
    }
}
