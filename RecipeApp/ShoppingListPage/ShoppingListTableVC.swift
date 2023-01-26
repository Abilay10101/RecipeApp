//
//  ShoppingListTableVC.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 17.11.2022.
//

import UIKit

class ShoppingListTableVC: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var cellId = "Idshka"
    private var models = [ToBuyListItem]()
    

    // MARK: - CoreData
    
    func getAllItems() {
        do {
            models = try context.fetch(ToBuyListItem.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            //error
        }
    }
    
    func createItem (name: String) {
        let newItem = ToBuyListItem(context: context)
        newItem.name = name
        newItem.imgStr = "chch1"
        
        do {
            try context.save()
            getAllItems()
        }
        catch {}
    }
    func deleteItem (item: ToBuyListItem) {
        context.delete(item)
        
        do {
            try context.save()
            getAllItems()
        }
        catch {}
    }
    
    func updateItem (item: ToBuyListItem , newName: String){
        item.name = newName
        
        do {
            try context.save()
            getAllItems()
        }
        catch {}
    }
    
    //MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shopping List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        getAllItems()
        tableView.register(ShoppingListTableViewCell.self, forCellReuseIdentifier: cellId)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }
    
    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Item", message: "Enter New Item", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else { return }
            self?.createItem(name: text)
        }))
        present(alert, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return models.count
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ShoppingListTableViewCell
        cell.imageView1.image = UIImage(named: model.imgStr!)
        cell.nameLabel.text = model.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = models[indexPath.row]
        
        if model.imgStr == "chch1" {
            model.imgStr = "chch2"
            
            do {
                try context.save()
                getAllItems()
            }
            catch {}
            
        } else {
            
            model.imgStr = "chch1"
            
            do {
                try context.save()
                getAllItems()
            }
            catch {}
            
        }
        
        
    }
    
    //MARK: - Delete and Move objects
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == .delete ) {
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                let context = appDelegate.persistentContainer.viewContext
                let objForDelete = models[indexPath.row]
                
                context.delete(objForDelete)
                appDelegate.saveContext()
            }
            models.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
    }
    
    

}
