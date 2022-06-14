//
//  DefaultTableViewCell.swift
//  SettingsTableViewApp
//
//  Created by Даниил Смирнов on 30.05.2022.
//

import UIKit

class DefaultTableViewCell: UITableViewCell {

    let type = ContentModel.contentType.defaultCell
    static let reuseId = "DefaultTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
