//
//  OptionsTableVC.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 01.12.2022.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOptions]
}

struct SettingsOptions {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (()-> Void)
}

class OptionsTableVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Options"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: OptionsTableViewCell.identifier)
        configure()
        
    }
    
    var models = [Section]()
    
    func configure() {
        
        models.append(Section(title: "Policies and conditions".uppercased(), options: [
            SettingsOptions(title: "Privacy Policy", icon: UIImage(systemName: "text.justify.left"), iconBackgroundColor: .systemCyan) {
                print("lala")
            },
            SettingsOptions(title: "Operating conditions", icon: UIImage(systemName: "books.vertical"), iconBackgroundColor: .systemBlue) {},
        ]))
        
        models.append(Section(title: "About Us".uppercased(), options: [
            SettingsOptions(title: "Information", icon: UIImage(systemName: "person.3"), iconBackgroundColor: .systemPink) {}
        ]))
        
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return models[section].options.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OptionsTableViewCell.identifier , for: indexPath) as? OptionsTableViewCell else { return UITableViewCell() }
        cell.configure(with: model)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        model.handler()
    }

    

}
