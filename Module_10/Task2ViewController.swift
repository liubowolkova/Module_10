//
//  Task2ViewController.swift
//  Module_10
//
//  Created by Любовь Волкова on 19.04.2021.
//

import UIKit

class Task2ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private lazy var names = ["Авиарежим", "Wi-Fi", "Bluetooth", "Сотовая связь", "Режим модема", "Уведомления", "Звуки, тактильные сигналы", "Не беспокоить", "Экранное время", "Основные", "Пункт управления", "Экран и яркость"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Cut extra cells
        tableView.tableFooterView = UIView()
    }
}

extension Task2ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell") as! Task2TableViewCell
        // cell.imageContainer.image = UIImage(named: "Pic_1.png")!
        cell.label.text = names[indexPath.row]
        
        return cell
    }
}
