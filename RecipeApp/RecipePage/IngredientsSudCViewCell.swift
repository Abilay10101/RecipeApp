//
//  IngredientsSudCViewCell.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 27.11.2022.
//

import UIKit

class IngredientsSudCViewCell: UICollectionViewCell {
    
    func addElementToCoreDataArray(element: Any) {
            NotificationCenter.default.post(name: .addElementToCoreDataArray, object: nil, userInfo: ["element": element])
    }
    
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
        //btn.addTarget(IngredientsSudCViewCell.self, action: #selector(bbb), for: .touchUpInside)
        btn.tintColor = .gray
        return btn
    }()
    
    /*@objc func bbb () {
        btnAdd.setImage(UIImage(systemName: "cart"), for: .normal)
    }*/
    
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
