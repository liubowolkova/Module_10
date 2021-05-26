//
//  Task2_1ViewController.swift
//  Module_10
//
//  Created by Любовь Волкова on 24.05.2021.
//

import UIKit

class Task2_1ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private lazy var items: [[ItemSettings]] = []
    private let table = UITableView()
    private let titleHeader: UILabel = {
        let label = UILabel()
        label.text = "Настройки"
        label.font = UIFont(name: "Helvetica-Bold", size: 24)
        label.tintColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<BasicData.getNames().count {
            let settingItems = ItemSection(names: BasicData.getNames()[i], icons: BasicData.getIcons()[i], colors: BasicData.getColors()[i], propNames: BasicData.getPropNames()[i]).getItems()
            self.items.append(settingItems)
        }
        
        self.view.addSubview(table)
        self.setTableAnchors()
        
        table.dataSource = self
        table.register(Task2_1TableViewCell.self, forCellReuseIdentifier: "SettingCell")
        table.delegate = self
        
        let tableSize = table.bounds
        table.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableSize.width, height: 60))
        table.tableHeaderView!.addSubview(titleHeader)
        table.tableHeaderView!.backgroundColor = .lightGray
        self.setTitleHeaderAnchors()
        
        //table.tableHeaderView = UIView()
        //self.setTableHeaderAnchors()
    }
    
    private func setTableAnchors() {
        let table = self.table
        let superView = table.superview!
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        table.leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
        table.rightAnchor.constraint(equalTo: superView.rightAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
    
    private func setTableHeaderAnchors() {
        if let header = self.table.tableHeaderView {
            header.translatesAutoresizingMaskIntoConstraints = false
            header.heightAnchor.constraint(equalToConstant: 60).isActive = true
        }
    }
    
    private func setTitleHeaderAnchors() {
        let title = self.titleHeader
        guard let headerView = table.tableHeaderView else { return }
        title.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
    }
    
    private func setSystemIconSettings(imageView: UIImageView, icon: String, color: UIColor) {
        imageView.image = UIImage(systemName: icon)
        imageView.backgroundColor = color
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\n"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentItem = items[indexPath.section][indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! Task2_1TableViewCell
        cell.item = currentItem
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 10 : 40
    }
}
