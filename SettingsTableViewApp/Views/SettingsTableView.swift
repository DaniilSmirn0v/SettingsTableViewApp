//
//  SettingsTableView.swift
//  SettingsTableViewApp
//
//  Created by Даниил Смирнов on 14.06.2022.
//

import UIKit

class SettingsTableView: UIView {
    
    //MARK: - Views
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DefaultTableViewCell.self, forCellReuseIdentifier: DefaultTableViewCell.reuseId)
        tableView.register(WithSwitcherTableViewCell.self, forCellReuseIdentifier: WithSwitcherTableViewCell.reuseId)
        tableView.register(WithSubTitleTableViewCell.self, forCellReuseIdentifier: WithSubTitleTableViewCell.reuseId)
        tableView.register(AccessorryTableViewCell.self, forCellReuseIdentifier: AccessorryTableViewCell.reuseId)
        
        return tableView
    }()
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHieararchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Settings
    private func setupHieararchy() {
        self.addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

