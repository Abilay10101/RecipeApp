//
//  SubView1CollectionViewCell.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 27.11.2022.
//

import UIKit
import SnapKit

class SubView1CollectionViewCell: UICollectionViewCell {
    
    let percentLabel: UILabel = {
        var label = UILabel()
        label.text = "Hello"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 15)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 3
                layer.borderColor = UIColor.tabBarItemAccent.cgColor
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 10
        addSubview(percentLabel)
    }
    
    func setConstraints() {
        
        percentLabel.snp.makeConstraints({ make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        })
        
        //NSLayoutConstraint.activate([])
        
    }
}
