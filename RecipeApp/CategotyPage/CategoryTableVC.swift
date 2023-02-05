//
//  CategoryTableVC.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 17.11.2022.
//

import UIKit

class CategoryTableVC: UITableViewController {

    var cellId = "cellID"
    var catArr = [CategoriesStr(name: "Beef", imgStr: "🍖"),
                  CategoriesStr(name: "Steaks", imgStr: "🥩"),
                  CategoriesStr(name: "Chicken breasts", imgStr: "🍗"),
                  CategoriesStr(name: "Live lobster", imgStr: "🦞"),
                  CategoriesStr(name: "Cheese", imgStr: "🧀"),
                  CategoriesStr(name: "Spaghetti", imgStr: "🍝"),
                  CategoriesStr(name: "Ramen noodles", imgStr: "🥡"),
                  CategoriesStr(name: "Rice", imgStr: "🍚"),
                  CategoriesStr(name: "Mushroom", imgStr: "🍄"),
                  CategoriesStr(name: "Potatoes", imgStr: "🥔"),
                  CategoriesStr(name: "Coffee", imgStr: "☕️"),
                  CategoriesStr(name: "Milk", imgStr: "🥛")
    ]
    
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
        return catArr.count
    }
    
    //MARK: - TableView Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let catEl = catArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CategoryTableViewCell
        cell.label.text = catEl.imgStr
        cell.nameLabel.text = catEl.name
        
        //cell.nameLabel.text = ""
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let innC = InnerCategoryCollectiovVC()
        innC.textURL = "https://api.spoonacular.com/recipes/findByIngredients?ingredients=\(catArr[indexPath.row].name.lowercased())&number=100&apiKey=f838e6d2bf2f41e88328e0582180d430"
        navigationController?.pushViewController(innC, animated: true)
    }
    

}
