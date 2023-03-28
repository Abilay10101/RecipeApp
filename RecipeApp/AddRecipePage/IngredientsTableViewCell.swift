//
//  IngredientsTableViewCell.swift
//  RecipeApp
//
//  Created by Mac on 28.03.2023.
//

import UIKit
import SnapKit

class IngredientsTableViewCell: UITableViewCell {
    
    var minusImageView: UIImageView!
    var ingredientQuantityTF: UITextField!
    var ingredientNameTF: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        layout()
    }

    func setup() {
        minusImageView = UIImageView()
        minusImageView.translatesAutoresizingMaskIntoConstraints = false
        minusImageView.image = UIImage(named: "Minus-Border")
        contentView.addSubview(minusImageView)
        
        ingredientQuantityTF = UITextField()
        ingredientQuantityTF.translatesAutoresizingMaskIntoConstraints = false
        ingredientQuantityTF.layer.borderWidth = 1
        ingredientQuantityTF.layer.cornerRadius = 10
        ingredientQuantityTF.layer.borderColor = UIColor.neutral20?.cgColor
        ingredientQuantityTF.font = UIFont.poppins(14, weight: PoppinsWeight.regular)
        ingredientQuantityTF.textColor = UIColor.neutral100
        ingredientQuantityTF.indent(size: 15)
        ingredientQuantityTF.keyboardType = .numberPad
        contentView.addSubview(ingredientQuantityTF)

        ingredientNameTF = UITextField()
        ingredientNameTF.translatesAutoresizingMaskIntoConstraints = false
        ingredientNameTF.layer.borderWidth = 1
        ingredientNameTF.layer.cornerRadius = 10
        ingredientNameTF.layer.borderColor = UIColor.neutral20?.cgColor
        ingredientNameTF.font = UIFont.poppins(14, weight: PoppinsWeight.regular)
        ingredientNameTF.textColor = UIColor.neutral100
        ingredientNameTF.indent(size: 15)
        contentView.addSubview(ingredientNameTF)
    }
    
    func layout() {
        ingredientQuantityTF.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(68)
            make.height.equalTo(44)
            make.width.equalTo(115)
        }
        
        ingredientNameTF.snp.makeConstraints { make in
            make.centerY.equalTo(ingredientQuantityTF)
            make.trailing.equalTo(ingredientQuantityTF.snp.leading).inset(-12)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(ingredientQuantityTF)
        }
        
        minusImageView.snp.makeConstraints { make in
            make.leading.equalTo(ingredientQuantityTF.snp.trailing).inset(-12)
            make.centerY.equalTo(ingredientQuantityTF)
            make.width.height.equalTo(24)
        }

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

