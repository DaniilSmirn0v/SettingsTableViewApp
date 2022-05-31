//
//  SettingsTableViewController.swift
//  SettingsTableViewApp
//
//  Created by Даниил Смирнов on 30.05.2022.
//

import UIKit

class SettingsTableViewController: UIViewController {
    
    //MARK: - Model
    var section = ContentModel.sections
    var rows = ContentModel.rowsInSection
    
    //MARK: - Views
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(defaultTableViewCell.self, forCellReuseIdentifier: "default")
        tableView.register(withSwitcherTableViewCell.self, forCellReuseIdentifier: "switcher")
        tableView.register(withSubTitleTableViewCell.self, forCellReuseIdentifier: "subTitle")
        tableView.register(accessorryTableViewCell.self, forCellReuseIdentifier: "accessorry")
        
        return tableView
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupHieararchy()
        setupNavigationController()
        setupLayout()
    }
    
    //MARK: - Settings
    private func setupHieararchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupNavigationController() {
        title = "Настройки"
        navigationController?.navigationBar.isTranslucent = true
    }
}

//MARK: - TableViewDataSource
extension SettingsTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        section.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ContentModel.getRowsIn(section: section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = ContentModel.sections[indexPath.section]
        if let rows = ContentModel.rowsInSection[section] {
            let row = rows[indexPath.row]
            
            switch row.type {
            case .imageTitleSwitcher:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "switcher", for: indexPath) as? withSwitcherTableViewCell {
                    var content = cell.defaultContentConfiguration()
                    content.image = UIImage(systemName: row.image ?? "circle")
                    content.text = row.title
                    cell.contentConfiguration = content
                    
                    return cell
                }
            case .imageTitleSubTitle:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "subTitle", for: indexPath) as? withSubTitleTableViewCell {
                    var content = cell.defaultContentConfiguration()
                    content.image = UIImage(systemName: row.image ?? "circle")
                    content.text = row.title
                    content.secondaryText = row.subTitle
                    cell.accessoryType = .disclosureIndicator
                    cell.contentConfiguration = content
                    
                    return cell
                }
            case .defaultCell:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath) as? defaultTableViewCell {
                    var content = cell.defaultContentConfiguration()
                    content.image = UIImage(systemName: row.image ?? "circle")
                    content.text = row.title
                    cell.accessoryType = .disclosureIndicator
                    cell.contentConfiguration = content
                    
                    return cell
                }
            case .withBadge:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "accessorry", for: indexPath) as? accessorryTableViewCell {
                    var content = cell.defaultContentConfiguration()
                    content.image = UIImage(systemName: row.image ?? "circle")
                    content.text = row.title
                    cell.accessoryType = .disclosureIndicator
                    cell.contentConfiguration = content
                    
                    return cell
                }
            }
        }
        return UITableViewCell()
    }
}
//MARK: - TableViewDelegate

extension SettingsTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)
        
        let section = ContentModel.sections[indexPath.section]
        if let rows = ContentModel.rowsInSection[section] {
            let row = rows[indexPath.row]
            print("Нажата ячейка - \( row.title)")
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
