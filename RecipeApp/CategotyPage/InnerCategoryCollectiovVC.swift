//
//  InnerCategoryCollectiovVC.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 01.12.2022.
//

import UIKit
import Alamofire

private let reuseIdentifier = "Cell"

class InnerCategoryCollectiovVC: UICollectionViewController , UICollectionViewDelegateFlowLayout {
    
    var textURL = "https://api.spoonacular.com/recipes/findByIngredients?ingredients=beef&number=10&apiKey=f838e6d2bf2f41e88328e0582180d430"
    let cellId = "cellId"
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    let searchController = UISearchController(searchResultsController: nil)
    
    let arrTest = [RecipeStr]()
    var filteredData = [RecipeStr]()

    override func viewDidLoad() {
        super.viewDidLoad()

        filteredData = arrTest

        self.collectionView!.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        title = "Recipes"
        
        configureSearchController()
        parseCategoreRecipes()
    }
    
    var idArr = [Int]()
    
    func parseCategoreRecipes () {
        Alamofire.request(textURL, method: .get).responseJSON { (response) in
            
            let jsonData = response.result.value as! NSArray
            
            for i in 0..<jsonData.count {
                let singeElement = jsonData[i] as! NSDictionary
                
                let name = singeElement["title"] as! String
                let imgStr = singeElement["image"] as! String
                let id = singeElement["id"] as! Int
                self.idArr.append(id)
                
                self.filteredData.append(RecipeStr(image: imgStr, name: name))
                self.collectionView.reloadData()
            }
            
        }
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
        self.navigationItem.hidesSearchBarWhenScrolling = false
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
        detailVC.testURL2 = "https://api.spoonacular.com/recipes/\(idArr[indexPath.item])/information?apiKey=f838e6d2bf2f41e88328e0582180d430"
        navigationController?.pushViewController(detailVC, animated: true)
    }

}

extension InnerCategoryCollectiovVC: UISearchResultsUpdating , UISearchBarDelegate {
    
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

