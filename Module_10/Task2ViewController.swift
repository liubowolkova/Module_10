//
//  Task2ViewController.swift
//  Module_10
//
//  Created by Любовь Волкова on 19.04.2021.
//

import UIKit

struct SettingsItem {
    var name: String
    var icon: String
    var color: UIColor
    var propName: String
}

class Task2ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private lazy var names = ["Авиарежим", "Wi-Fi", "Bluetooth", "Сотовая связь", "Режим модема", "Уведомления", "Звуки, тактильные сигналы", "Не беспокоить", "Экранное время", "Основные", "Пункт управления", "Экран и яркость"]
    private lazy var colors: [UIColor] = [.orange, .blue, .blue, .green, .green, .red, .systemPink, .purple, .purple, .gray, .gray, .blue]
    private lazy var icons = ["airplane", "wifi", "link", "antenna.radiowaves.left.and.right", "personalhotspot", "square", "volume.3.fill", "moon.fill", "hourglass", "gear","capsule", "textformat.size"]
    private lazy var propNames = ["", "Anvics-YOTA", "Вкл.", "", "", "", "", "", "", "", "", ""]
    private lazy var settingsItemList: [SettingsItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsItemList = self.generateSettingsItemList(names: names, icons: icons, colors: colors, propNames: propNames)
        
        // Cut extra cells
        tableView.tableFooterView = UIView()
    }
    
    private func setSystemIconSettings(imageView: UIImageView, icon: String, color: UIColor) {
        imageView.image = UIImage(systemName: icon)
        imageView.backgroundColor = color
        imageView.layer.cornerRadius = 5
        imageView.tintColor = .white
    }
    
    private func createSettingsItem(name: String, icon: String, color: UIColor, propName: String) -> SettingsItem {
        let item = SettingsItem(name: name, icon: icon, color: color, propName: propName)
        
        return item
    }
    
    private func generateSettingsItemList(names: [String], icons: [String], colors: [UIColor], propNames: [String]) -> [SettingsItem]{
        var array: [SettingsItem] = []
        for (i, e) in names.enumerated() {
            array.append(self.createSettingsItem(name: e, icon: icons[i], color: colors[i], propName: propNames[i]))
        }
        
        return array
    }
}

extension Task2ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Creating cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell") as! Task2TableViewCell
        // Customizing cell
        let currentItem = settingsItemList[indexPath.row]
        self.setSystemIconSettings(imageView: cell.imageContainer, icon: currentItem.icon, color: currentItem.color)
        cell.label.text = currentItem.name
        cell.chevronForvard.isHidden = currentItem.icon == "airplane"
        cell.propLabel.text = currentItem.propName
        cell.switchElement.isHidden = !(currentItem.icon == "airplane")
        
        return cell
    }
}
