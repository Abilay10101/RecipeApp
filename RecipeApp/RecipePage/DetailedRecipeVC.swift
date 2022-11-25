//
//  DetailedRecipeVC.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 24.11.2022.
//

import UIKit

class DetailedRecipeVC: UIViewController {
    
    var img = UIImage()
    var name = String()
    
    let imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .green
        return imageView
    }()
    
    let nameLabel: UILabel = {
        var label = UILabel()
        label.text = "Hello"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 23)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        
        imageView.image = img
        nameLabel.text = name
        
    }
    
    func setupView () {
        view.addSubview(imageView)
        view.addSubview(nameLabel)
    }
    
    func setupConstraints () {
        
        view.backgroundColor = .systemBackground
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.height.equalTo(view.frame.width / 2)
            make.width.equalTo(view.frame.width / 2)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(view.frame.width / 2)
        }
    }
    
    
    
    

}
