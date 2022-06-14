//
//  AccessorryTableViewCell.swift
//  SettingsTableViewApp
//
//  Created by Даниил Смирнов on 31.05.2022.
//

import UIKit

class AccessorryTableViewCell: UITableViewCell {
    
    let type = ContentModel.contentType.withBadge
    static let reuseId = "AccessorryTableViewCell"
    
    private lazy var image: UIImageView = {
        var image = UIImageView(image: UIImage())
        image.contentMode = .center
        
        return image
    }()
    
    private lazy var label: UILabel = {
        var label = UILabel()
        
        return label
    }()
    
     lazy var badgeView: UITableViewCell = {
        let badgeView = UITableViewCell()
         let size: CGFloat = 22
         let digits = Int.random(in: 1...5)
         let width = max(size, 0.7 * size * 1)
         let badge = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: size))
         badge.text = "\(digits)"
         badge.layer.cornerRadius = size / 2
         badge.layer.masksToBounds = true
         badge.textAlignment = .center
         badge.textColor = .white
         badge.backgroundColor = .red
         badgeView.accessoryView = badge
         
        return badgeView
    }()
    
    lazy var accesView: UITableViewCell = {
       let accesView = UITableViewCell()
        accesView.translatesAutoresizingMaskIntoConstraints = false
        accesView.accessoryType = .none
  
        return accesView
    }()
   
    private let horrizontalStack: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 170
        stackView.alignment = .center
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "accessorry")
        addSubview(horrizontalStack)
        horrizontalStack.addArrangedSubview(image)
        horrizontalStack.addArrangedSubview(label)
        horrizontalStack.addArrangedSubview(badgeView)
        horrizontalStack.addArrangedSubview(accesView)
        
        horrizontalStack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        horrizontalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        horrizontalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horrizontalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupDataFrom(model: ContentModel) -> UIListContentConfiguration {
        var content: UIListContentConfiguration!
        content
        return content
    }
}
