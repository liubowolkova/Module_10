//
//  Task2TableViewCell.swift
//  Module_10
//
//  Created by Любовь Волкова on 19.04.2021.
//

import UIKit

class Task2TableViewCell: UITableViewCell {
    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var chevronForvard: UIImageView!
    @IBOutlet weak var propLabel: UILabel!
    @IBOutlet weak var switchElement: UISwitch!
    @IBOutlet weak var notification: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
