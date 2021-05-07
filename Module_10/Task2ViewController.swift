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

class SectionItem {
    private var names: [String]
    private var icons: [String]
    private var colors: [UIColor]
    private var propNames: [String]
    
    init(names: [String], icons: [String], colors: [UIColor], propNames: [String]) {
        self.names = names
        self.icons = icons
        self.colors = colors
        self.propNames = propNames
    }
    
    public func getItems() -> [SettingsItem] {
        return self.generateSettingsItemList(names: self.names, icons: self.icons, colors: self.colors, propNames: self.propNames)
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

class Task2ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    // Data
    private lazy var names = [
        ["Авиарежим", "Wi-Fi", "Bluetooth", "Сотовая связь", "Режим модема"],
        ["Уведомления", "Звуки, тактильные сигналы", "Не беспокоить", "Экранное время"],
        ["Основные", "Пункт управления", "Экран и яркость"]
    ]
    private lazy var icons = [
        ["airplane", "wifi", "link", "antenna.radiowaves.left.and.right", "personalhotspot"],
        ["square", "volume.3.fill", "moon.fill", "hourglass"],
        ["hourglass", "gear","capsule", "textformat.size"]
    ]
    private lazy var colors: [[UIColor]] = [
        [.orange, .blue, .blue, .green, .green],
        [.red, .systemPink, .purple, .purple],
        [.gray, .gray, .blue]
    ]
    private lazy var propNames = [
        ["", "Anvics-YOTA", "Вкл.", "", ""],
        ["", "", "", ""],
        ["", "", ""]
    ]
    
    // Composed data
    private lazy var items: [[SettingsItem]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Compose date
        for i in 0..<names.count {
            let settingItems = SectionItem(names: names[i], icons: icons[i], colors: colors[i], propNames: propNames[i]).getItems()
            self.items.append(settingItems)
        }
        
        // Create table header
        let tableSize = tableView.bounds
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableSize.width, height: 60))
        
        let title = UILabel()
        title.text = "Настройки"
        title.font = UIFont(name: "Helvetica", size: 28)
        title.tintColor = .black
        tableView.tableHeaderView!.addSubview(title)
        
        // Set title center into headerView
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerXAnchor.constraint(equalTo: tableView.tableHeaderView!.centerXAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: tableView.tableHeaderView!.centerYAnchor).isActive = true
 
        // Cut extra cells
        tableView.tableFooterView = UIView()
    }
    
    private func setSystemIconSettings(imageView: UIImageView, icon: String, color: UIColor) {
        imageView.image = UIImage(systemName: icon)
        imageView.backgroundColor = color
        imageView.layer.cornerRadius = 5
        imageView.tintColor = .white
    }
}

extension Task2ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Creating cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell") as! Task2TableViewCell

        // Customizing cell
        let currentItem = items[indexPath.section][indexPath.row]
        //let currentItem = settingsItemList[indexPath.row]
        self.setSystemIconSettings(imageView: cell.imageContainer, icon: currentItem.icon, color: currentItem.color)
        cell.label.text = currentItem.name
        cell.chevronForvard.isHidden = currentItem.icon == "airplane"
        cell.propLabel.text = currentItem.propName
        cell.switchElement.isHidden = !(currentItem.icon == "airplane")
        cell.notification.isHidden = !(currentItem.icon == "gear")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\n"
    }
}
