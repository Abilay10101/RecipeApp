//
//  ShoppingListTableViewCell.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 21.01.2023.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

    var imageView1 : UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //var view1 = UIView()
    
    var nameLabel : UILabel = {
        var label = UILabel()
        label.text = "Coconut"
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
        addSubview(contentView)
        contentView.addSubview(imageView1)
        contentView.addSubview(nameLabel)
    }
    
    func setupConstraints() {
        
        imageView1.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalTo(35)
            make.height.equalTo(35)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView1.snp.right).offset(10)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(35)
        }
        
    }

}
