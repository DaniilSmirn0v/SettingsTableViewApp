//
//  WithSubTitleTableViewCell.swift
//  SettingsTableViewApp
//
//  Created by Даниил Смирнов on 30.05.2022.
//

import UIKit

class WithSubTitleTableViewCell: UITableViewCell {

    let type = ContentModel.contentType.imageTitleSubTitle
    static let reuseId = "WithSubTitleTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(from model: ContentModel) -> UIListContentConfiguration {
        var content = defaultContentConfiguration()
        content.image = UIImage(systemName: model.image ?? "circle")
        content.text = model.title
        content.secondaryText = model.subTitle
        return content
    }
}
