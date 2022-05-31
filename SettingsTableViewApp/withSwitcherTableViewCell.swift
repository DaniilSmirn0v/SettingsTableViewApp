//
//  withSwitcherTableViewCell.swift
//  SettingsTableViewApp
//
//  Created by Даниил Смирнов on 30.05.2022.
//

import UIKit

class withSwitcherTableViewCell: UITableViewCell {

    let type = ContentModel.contentType.imageTitleSwitcher
    
    private lazy var image: UIImageView = {
        var image = UIImageView(image: UIImage())

        return image
    }()
    
    private lazy var label: UILabel = {
        var label = UILabel()
        
        return label
    }()
    
    private lazy var switcher: UISwitch = {
        let switcher = UISwitch()
        switcher.isOn = false
        return switcher
    }()
   
    private let horrizontalStack: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 100
        stackView.alignment = .center
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(horrizontalStack)
        horrizontalStack.addArrangedSubview(image)
        horrizontalStack.addArrangedSubview(label)
        horrizontalStack.addArrangedSubview(switcher)
        
        horrizontalStack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        horrizontalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        horrizontalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horrizontalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
