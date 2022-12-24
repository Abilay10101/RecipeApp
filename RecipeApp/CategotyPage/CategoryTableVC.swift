//
//  CategoryTableVC.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 17.11.2022.
//

import UIKit

class CategoryTableVC: UITableViewController {

    var cellId = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Category"
        navigationController?.navigationBar.prefersLargeTitles = true
        //navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.backgroundColor = .white
        
        let categoryTableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView = categoryTableView
        categoryTableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: cellId)
        //tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: cellId)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    //MARK: - TableView Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CategoryTableViewCell
        
        cell.imageView1.image = UIImage(named: "meme1")
        //cell.nameLabel.text = ""
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let innC = InnerCategoryCollectiovVC()
        navigationController?.pushViewController(innC, animated: true)
    }
    

}
