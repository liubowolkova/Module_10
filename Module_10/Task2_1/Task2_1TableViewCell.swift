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
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconContainer.addSubview(icon)
        self.contentView.addSubview(iconContainer)
        self.contentView.addSubview(nameLabel)
        
        self.setAnchors()
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
}
