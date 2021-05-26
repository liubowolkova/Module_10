//
//  Task2_1TableViewCell.swift
//  Module_10
//
//  Created by Любовь Волкова on 25.05.2021.
//

import UIKit

class Task2_1TableViewCell: UITableViewCell {
    let iconContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let icon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.tintColor = .white
        icon.contentMode = .scaleAspectFit
        
        return icon
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let chevronIcon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.tintColor = .lightGray
        
        return icon
    }()
    
    let propName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .lightGray
        
        return label
        
    }()
    
    let switchButton: UISwitch = {
        let switchB = UISwitch()
        switchB.translatesAutoresizingMaskIntoConstraints = false
        switchB.isEnabled = false
        
        return switchB
    }()
    
    let notificationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "1.circle.fill")
        imageView.tintColor = .red
        
        return imageView
    }()
    
    var item: ItemSettings? {
        didSet {
            guard item != nil else { return }
            if let iconName = item?.icon {
                icon.image = UIImage(systemName: iconName)
            }
            if let color = item?.color {
                iconContainer.backgroundColor = color
            }
            if let name = item?.name {
                nameLabel.text = name
                
                if name == "airplane" {
                    self.setRightElementsAnchors(element: chevronIcon, show: false)
                    self.setRightElementsAnchors(element: propName, show: false)
                    self.setRightElementsAnchors(element: switchButton, show: true)
                    self.setRightElementsAnchors(element: notificationIcon, show: false)
                } else if name != "Основные" {
                    self.setRightElementsAnchors(element: chevronIcon, show: true)
                    self.setRightElementsAnchors(element: propName, show: false)
                    self.setRightElementsAnchors(element: switchButton, show: false)
                    self.setRightElementsAnchors(element: notificationIcon, show: false)
                } else {
                    self.setRightElementsAnchors(element: chevronIcon, show: true)
                    self.setRightElementsAnchors(element: propName, show: false)
                    self.setRightElementsAnchors(element: switchButton, show: false)
                    self.setRightElementsAnchors(element: notificationIcon, show: true)
                }
            }
            if let prop = item?.propName {
                propName.text = prop
                self.setRightElementsAnchors(element: propName, show: true)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconContainer.addSubview(icon)
        self.contentView.addSubview(iconContainer)
        self.contentView.addSubview(nameLabel)
        
        self.setAnchors()
        
        self.contentView.addSubview(chevronIcon)
        self.contentView.addSubview(propName)
        self.contentView.addSubview(switchButton)
        self.contentView.addSubview(notificationIcon)
        
        self.setVerticalAlign()
    }

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setAnchors() {
        let icon = self.icon
        let iconContainer = self.iconContainer
        let nameLabel = self.nameLabel
        let view = self.contentView
        
        iconContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        iconContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        iconContainer.widthAnchor.constraint(equalToConstant: 36).isActive = true
        iconContainer.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        icon.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor).isActive = true
        icon.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor).isActive = true
        icon.widthAnchor.constraint(equalTo: iconContainer.widthAnchor, multiplier: 0.7).isActive = true
        icon.heightAnchor.constraint(equalTo: iconContainer.heightAnchor, multiplier: 0.7).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 15).isActive = true
    }
    
    private func setRightElementsSize() {
        let rightIcons = [self.chevronIcon, self.notificationIcon]
        
        for icon in rightIcons {
            icon.widthAnchor.constraint(equalToConstant: 36).isActive = true
            icon.heightAnchor.constraint(equalToConstant: 36).isActive = true
        }
    }
    
    private func setVerticalAlign() {
        let elements = [self.chevronIcon, self.notificationIcon, self.propName, self.switchButton]
        
        for element in elements {
            element.centerYAnchor.constraint(equalTo: element.superview!.centerYAnchor).isActive = true
            element.isHidden = true
        }
    }
    
    private func setRightElementsAnchors(element: UIView, show: Bool) {
        element.isHidden = !show
        
        switch element {
        case self.chevronIcon:
            chevronIcon.rightAnchor.constraint(equalTo: chevronIcon.superview!.rightAnchor, constant: -20).isActive = show
        case self.propName:
            propName.rightAnchor.constraint(equalTo: chevronIcon.leftAnchor, constant: -20).isActive = show
        case self.switchButton:
            switchButton.rightAnchor.constraint(equalTo: switchButton.superview!.rightAnchor, constant: -20).isActive = show
        case self.notificationIcon:
            notificationIcon.rightAnchor.constraint(equalTo: chevronIcon.leftAnchor, constant: -20).isActive = show
        default:
            break
        }
    }
}
