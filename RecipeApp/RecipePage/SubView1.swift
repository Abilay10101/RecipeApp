//
//  SubView1.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 27.11.2022.
//

import Foundation
import UIKit
import SnapKit

class SubView1: UIView {
    
    /*let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Tips"
        label.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()*/
    
    let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let tipsArray = ["10мин подготовка" , "10мин готовка" , "1 сложность" , "2 порции"]
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
        
        //addSubview(titleLabel)
        addSubview(collectionView)
        collectionView.register(SubView1CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension SubView1: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SubView1CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.percentLabel.text = tipsArray[indexPath.row]
        return cell
    }
    
}

extension SubView1: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 4.4 , height: collectionView.frame.width / 4.5 )
    }
    
}

extension SubView1 {
    
    func setConstraints() {
        
        collectionView.snp.makeConstraints({ make in
            make.top.equalToSuperview().offset(2)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        })
        
        //NSLayoutConstraint.activate([
            //titleLabel.topAnchor.constraint(equalTo: topAnchor , constant: 0) ,
            //titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 10),
            
            //collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            //collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            //collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            //collectionView.heightAnchor.constraint(equalToConstant: 100)
        
        //])
    }
    
}
