//
//  FavoritesCollectionVC.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 17.11.2022.
//

import UIKit
import Alamofire

private let reuseIdentifier = "Cell"

extension Notification.Name {
    static let addElementToCoreDataArray2 = Notification.Name("AddElementToCoreDataArray2")
}

class FavoritesCollectionVC: UICollectionViewController , UICollectionViewDelegateFlowLayout {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let cellId = "cellId"
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    let searchController = UISearchController(searchResultsController: nil)
    
    let arrTest = [RecipeStr]()
    var filteredData = [RecipeStr]()
    var models = [FavoritesDat]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerForNotifications()
        
        filteredData = arrTest
        
        //clearFunc()

        self.collectionView!.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        let barBtn2 : UIBarButtonItem = {
            let barBtn2 = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(function2))
            barBtn2.tintColor = .tabBarItemAccent
            return barBtn2
        }()
        
        navigationItem.setRightBarButtonItems([barBtn2], animated: true)
        
        configureSearchController()
        
        
        
        getAllItems()
    }
    
    func clearFunc() {
        
        do {
            models = try context.fetch(FavoritesDat.fetchRequest())
            for i in 0..<models.count {
                print(models[i].id)
            }
        }
        catch {}
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            
            for obj in models {
                context.delete(obj)
            }
            
            appDelegate.saveContext()
        }
        models.removeAll()
    }
    
    func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleAddElementNotification2), name: .addElementToCoreDataArray2, object: nil)
    }
    
    @objc func handleAddElementNotification2(notification: Notification) {
        if let element = notification.userInfo?["element"] as? Any {
            let newItem = FavoritesDat(context: context)
            newItem.id = element as! Int64
            print(newItem.id)
            do {
                try context.save()
                getAllItems()
            }
            catch {}
        }
    }
    
    func getAllItems() {
        do {
            models = try context.fetch(FavoritesDat.fetchRequest())
            fetchFavoriteData()
        }
        catch {
            //error
        }
    }
    
    func fetchFavoriteData () {
        
        if models.count > 0 {
            for i in 0..<models.count {
                let url = "https://api.spoonacular.com/recipes/\(models[i].id)/information?apiKey=f838e6d2bf2f41e88328e0582180d430"
                Alamofire.request(url, method: .get).responseJSON { (response) in
                    //print(self.models[i].id)
                    let jsonData = response.result.value as! NSDictionary
                    let name = jsonData["title"] as? String
                    let imgStr = jsonData["image"] as? String
                    
                    self.filteredData.append(RecipeStr(image: imgStr ?? "", name: name))
                    
                    self.collectionView.reloadData()
                }
            }

        }
        
    }
    
    @objc func function2 () {
        let optionsVC = OptionsTableVC()
        navigationController?.pushViewController(optionsVC, animated: true)
    }
    
    init() {
            super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = true
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search Food By Name"
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RecipeCollectionViewCell
        
        if filteredData.isEmpty {
            
        } else {
            cell.recipe = filteredData[indexPath.item]
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width) - 40 , height: view.frame.height / 2.4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailedRecipeVC()
        detailVC.testURL2 = "https://api.spoonacular.com/recipes/\(models[indexPath.item].id)/information?apiKey=f838e6d2bf2f41e88328e0582180d430"
        navigationController?.pushViewController(detailVC, animated: true)
    }
}


extension FavoritesCollectionVC: UISearchResultsUpdating , UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        
        filteredData = []
        
        if searchText == "" {
            filteredData = arrTest
        }
        
        for word in arrTest {
            if word.name!.uppercased().contains(searchText.uppercased()) {
                filteredData.append(word)
            }
        }
        
        self.collectionView.reloadData()
        
    }
    
}
