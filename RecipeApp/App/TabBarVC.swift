//
//  TabBarVC.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 18.11.2022.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar () {
        
        let recipeVC = RecipesCollectionVC()
        let categoryVC = CategoryTableVC()
        let shoppingListVC = ShoppingListTableVC()
        let favoritesVC = FavoritesCollectionVC()
        
        let recipeNav = UINavigationController(rootViewController: recipeVC)
        let categoryNav = UINavigationController(rootViewController: categoryVC)
        let shoppingListNav = UINavigationController(rootViewController: shoppingListVC)
        let favoritesNav = UINavigationController(rootViewController: favoritesVC)
        
        viewControllers = [
            generateVC(recipeNav , "Recipes" , UIImage(systemName: "fork.knife.circle")) ,
            generateVC(categoryNav,  "Category" , UIImage(systemName: "list.dash")) ,
            generateVC(shoppingListNav , "Shopping List", UIImage(systemName: "cart")) ,
            generateVC(favoritesNav , "Favorites" , UIImage(systemName: "star"))
        ]
    }
    
    private func generateVC(_ viewController: UINavigationController ,_ title: String,_ image: UIImage?) -> UINavigationController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 8
        let positionOnY : CGFloat = 15
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(
            x: positionOnX,
            y: tabBar.bounds.minY - positionOnY,
            width: width,
            height: height),
            cornerRadius: height / 2
        )
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
        
    }
}
