//
//  DetailedRecipeVC.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 24.11.2022.
//

import UIKit

class DetailedRecipeVC: UIViewController {
    
    var img = UIImage()
    var name = "Ленивые сосичски в лаваше с сыром"
    var starFlag1 = true
    
    let imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .secondarySystemBackground
        return imageView
    }()
    
    let nameLabel: UILabel = {
        var label = UILabel()
        label.text = "Hello"
        label.textColor = UIColor.tabBarItemAccent
        label.font = UIFont(name: "Avenir Next Bold", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let subView1 = SubView1()
    
    let ingredientsView = IngredientsSubView()
    
    let textSubView = TextSubView()
    
    lazy var contendViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 400)
    
    lazy var scroll : UIScrollView = {
        var scroll = UIScrollView(frame: .zero)
        scroll.backgroundColor = .white
        scroll.frame = self.view.bounds
        scroll.contentSize = contendViewSize
        scroll.autoresizingMask = .flexibleHeight
        scroll.bounces = true
        return scroll
    }()
    
    lazy var boxView : UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.frame.size = contendViewSize
        return view
    }()
    
    
    @objc func function1 () {
        //barBtn2.image = UIImage(systemName: "star.fill")
        print("wow")
    }
    
    @objc func function2() {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        
        imageView.image = img
        nameLabel.text = name
        
        let barBtn1 : UIBarButtonItem = {
            let barBtn1 = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(function1))
            barBtn1.tintColor = .tabBarItemAccent
            return barBtn1
        }()
        
        let barBtn2 : UIBarButtonItem = {
            let barBtn2 = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(function2))
            barBtn2.tintColor = .tabBarItemAccent
            return barBtn2
        }()
        
        navigationItem.setRightBarButtonItems([barBtn1 , barBtn2], animated: true)
        
    }
    
    func setupView () {
        
        
        view.addSubview(scroll)
        scroll.addSubview(boxView)
        
        boxView.addSubview(imageView)
        boxView.addSubview(nameLabel)
        boxView.addSubview(subView1)
        boxView.addSubview(ingredientsView)
        boxView.addSubview(textSubView)

        
    }
    
    func setupConstraints () {
        
        scroll.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(view.frame.height )
        }
        
        view.backgroundColor = .systemBackground
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(boxView.snp.top)
            make.centerX.equalToSuperview()
            make.height.equalTo( boxView.frame.width / 1.5)
            make.width.equalTo(boxView.frame.width)
            
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(boxView.frame.width - 40)
        }
        
        subView1.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(110)
        }
        
        ingredientsView.snp.makeConstraints { make in
            make.top.equalTo(subView1.snp.bottom)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(450)
        }
        
        textSubView.snp.makeConstraints { make in
            make.top.equalTo(ingredientsView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(200)
        }
    }
    
    
    
    

}
