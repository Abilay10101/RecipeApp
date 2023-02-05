//
//  IngredientsSubView.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 27.11.2022.
//

import Foundation
import UIKit
import SnapKit

class IngredientsSubView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ingredients"
        label.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        label.font = UIFont(name: "Avenir Next Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var tipsArray = ["2 лаваша" , "300 грамм сыра" , "3 яйца" , "Щепотка соли" , "3 ложки сахара"]
    var tipsCount = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView () {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(collectionView)
        collectionView.register(IngredientsSudCViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension IngredientsSubView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tipsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? IngredientsSudCViewCell else {
            return UICollectionViewCell()
        }
        
        cell.percentLabel.text = tipsArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! IngredientsSudCViewCell
        cell.addElementToCoreDataArray(element: cell.percentLabel.text as Any)
        cell.btnAdd.setImage(UIImage(systemName: "cart.fill"), for: .normal)
    }
    
    
}

extension IngredientsSubView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.width / 5 )
    }
    
}

extension IngredientsSubView {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor , constant: 0) ,
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 0),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        
        ])
    }
    
}
