//
//  FavoritesCollectionVC.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 17.11.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class FavoritesCollectionVC: UICollectionViewController , UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    let searchController = UISearchController(searchResultsController: nil)
    
    let arrTest = [RecipeStr(image: "meme1", name: "meme1"), RecipeStr(image: "meme2", name: "meme2"), RecipeStr(image: "meme3", name: "meme3")]
    var filteredData = [RecipeStr]()

    override func viewDidLoad() {
        super.viewDidLoad()

        filteredData = arrTest

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
