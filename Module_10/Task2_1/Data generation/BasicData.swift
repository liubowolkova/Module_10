//
//  BasicData.swift
//  Module_10
//
//  Created by Любовь Волкова on 24.05.2021.
//

import UIKit

class BasicData {
    static func getNames() -> [[String]] {
        let names = [
            ["Авиарежим", "Wi-Fi", "Bluetooth", "Сотовая связь", "Режим модема"],
            ["Уведомления", "Звуки, тактильные сигналы", "Не беспокоить", "Экранное время"],
            ["Основные", "Пункт управления", "Экран и яркость"]
        ]
        
        return names
    }
    
    static func getIcons() -> [[String]] {
        let icons = [
            ["airplane", "wifi", "link", "antenna.radiowaves.left.and.right", "personalhotspot"],
            ["square", "volume.3.fill", "moon.fill", "hourglass"],
            ["hourglass", "gear","capsule", "textformat.size"]
        ]
        
        return icons
    }
    
    static func getColors() -> [[UIColor]] {
        let colors: [[UIColor]] = [
            [.orange, .blue, .blue, .green, .green],
            [.red, .systemPink, .purple, .purple],
            [.gray, .gray, .blue]
        ]
        
        return colors
    }
    
    static func getPropNames() -> [[String]] {
        let propNames = [
            ["", "Anvics-YOTA", "Вкл.", "", ""],
            ["", "", "", ""],
            ["", "", ""]
        ]
        
        return propNames
    }
}
