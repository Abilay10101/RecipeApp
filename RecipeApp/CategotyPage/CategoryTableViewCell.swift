//
//  CategoryTableViewCell.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 29.11.2022.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    let label : UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Avenir Next Bold", size: 40)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let nameLabel : UILabel = {
        var label = UILabel()
        label.text = "Breakfast"
        label.textColor = UIColor.tabBarItemAccent
        label.font = UIFont(name: "Avenir Next Bold", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupViews()
        setupConstraints()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        setupViews()
        setupConstraints()
    }
    
    func setupViews () {
        
        addSubview(label)
        addSubview(nameLabel)
    }
    func setupConstraints() {
        
        label.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalTo(contentView.frame.height )
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(label.snp.right).offset(5)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
    

}
