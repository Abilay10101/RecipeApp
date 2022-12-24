//
//  IngredientsSudCViewCell.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 27.11.2022.
//

import UIKit

class IngredientsSudCViewCell: UICollectionViewCell {
    let percentLabel: UILabel = {
        let label = UILabel()
        label.text = "10%"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let btnAdd: UIButton = {
        var btn = UIButton()
        btn.setImage(UIImage(systemName: "cart.badge.plus"), for: .normal)
        btn.tintColor = .gray
        return btn
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 3
                layer.borderColor = #colorLiteral(red: 0.639077723, green: 0.2492567599, blue: 0.6254395843, alpha: 1)
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
        addSubview(btnAdd)
    }
    
    func setConstraints() {
        
        percentLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(40)
            //make.width.equalTo(frame.width / 2)
        }
        
        btnAdd.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
    }
}
