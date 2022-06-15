//
//  SettingsTableViewController.swift
//  SettingsTableViewApp
//
//  Created by Даниил Смирнов on 30.05.2022.
//

import UIKit

class SettingsTableViewController: UIViewController {
    
    //MARK: - Model
    var sections = ContentModel.sections
    var rows = ContentModel.rowsInSection
        
    //MARK: - Initialize View
    private var settingsTableView: SettingsTableView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsTableView
    }
    
    //MARK: - LifeCycle
    override func loadView() {
        self.view = SettingsTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupNavigationController()
    }
}

//MARK: - Configure ViewController
extension SettingsTableViewController {
    
    private func configureView() {
        settingsTableView?.tableView.delegate = self
        settingsTableView?.tableView.dataSource = self
    }
    
    private func setupNavigationController() {
        title = "Настройки"
        navigationController?.navigationBar.isTranslucent = true
    }
}


//MARK: - TableViewDataSource
extension SettingsTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ContentModel.getRowsIn(section: section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        if let rows = rows[section] {
            let row = rows[indexPath.row]
            
            switch row.type {
            case .imageTitleSwitcher:
                if let cell = tableView.dequeueReusableCell(withIdentifier: WithSwitcherTableViewCell.reuseId, for: indexPath) as? WithSwitcherTableViewCell {
                    let content = cell.configureCell(from: row)
                    cell.contentConfiguration = content
                    return cell
                }
            case .imageTitleSubTitle:
                if let cell = tableView.dequeueReusableCell(withIdentifier: WithSubTitleTableViewCell.reuseId, for: indexPath) as? WithSubTitleTableViewCell {
                    let content = cell.configureCell(from: row)
                    cell.accessoryType = .disclosureIndicator
                    cell.contentConfiguration = content
                    return cell
                }
            case .defaultCell:
                if let cell = tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.reuseId, for: indexPath) as? DefaultTableViewCell {
                    let content = cell.configureCell(from: row)
                    cell.accessoryType = .disclosureIndicator
                    cell.contentConfiguration = content
                    return cell
                }
            case .withBadge:
                if let cell = tableView.dequeueReusableCell(withIdentifier: AccessorryTableViewCell.reuseId, for: indexPath) as? AccessorryTableViewCell {
                    let content = cell.configureCell(from: row)
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
