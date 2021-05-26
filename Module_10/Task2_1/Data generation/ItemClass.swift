//
//  ItemClass.swift
//  Module_10
//
//  Created by Любовь Волкова on 24.05.2021.
//

import UIKit

struct ItemSettings {
    var name: String
    var icon: String
    var color: UIColor
    var propName: String
}

class ItemSection {
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
    
    public func getItems() -> [ItemSettings] {
        return self.generateSettingsItemList(names: self.names, icons: self.icons, colors: self.colors, propNames: self.propNames)
    }
    
    private func createSettingsItem(name: String, icon: String, color: UIColor, propName: String) -> ItemSettings {
        let item = ItemSettings(name: name, icon: icon, color: color, propName: propName)
        
        return item
    }
    
    private func generateSettingsItemList(names: [String], icons: [String], colors: [UIColor], propNames: [String]) -> [ItemSettings]{
        var array: [ItemSettings] = []
        for (i, e) in names.enumerated() {
            array.append(self.createSettingsItem(name: e, icon: icons[i], color: colors[i], propName: propNames[i]))
        }
        
        return array
    }
}
