//
//  DetailedRecipeVC.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 24.11.2022.
//

import UIKit
import Alamofire

class DetailedRecipeVC: UIViewController {
    
    var testURL2 = "https://api.spoonacular.com/recipes/716429/information?apiKey=f838e6d2bf2f41e88328e0582180d430"
    //var testURL3 = "https://api.spoonacular.com/food/ingredients/search?number=10?apiKey=68ed6fc20ed34f96bf5ccf91c1d73e9a"
    
    var apiKey = "c8e8e1e30ba84635af33ced47ffedb97  716429"
    
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

        fetchDataHere()
        
    }
    
    func fetchDataHere() {
        Alamofire.request(testURL2, method: .get).responseJSON { (response) in
            let jsonData = response.result.value as! NSDictionary
            //let singleValue = jsonData[0] as! NSDictionary
            let name = jsonData["title"] as! String
            let imgStr = jsonData["image"] as! String
            
            let readyInMinutes = jsonData["readyInMinutes"] as! Int
            let servings = jsonData["servings"] as! Int
            let healthScore = jsonData["healthScore"] as! Int
            let vegan = jsonData["vegan"] as! Bool
            
            let summary = jsonData["summary"] as! String
            
            var ingredientsArr = [String]()
            
            let extendedIngredients = jsonData["extendedIngredients"] as! NSArray
            
            for i in 0..<extendedIngredients.count {
                let oneIng = extendedIngredients[i] as! NSDictionary
                let name = oneIng["name"] as! String
                let amount = oneIng["amount"] as! Float
                ingredientsArr.append("\(name), \(amount)")
            }
            
            self.nameLabel.text = name
            
            DispatchQueue.global().async {
                guard let imageUrl = URL(string: imgStr) else { return }
                guard let imageData = try? Data(contentsOf: imageUrl) else { return }
                
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: imageData)
                }
            }
            
            self.subView1.tipsArray[0] = "\(readyInMinutes) min of cooking"
            self.subView1.tipsArray[1] = "\(servings) servings"
            self.subView1.tipsArray[2] = "\(healthScore) health score"
            
            if vegan {
                self.subView1.tipsArray[3] = "vegan"
            } else {
                self.subView1.tipsArray[3] = "not vegan"
            }
            
            self.subView1.collectionView.reloadData()
            
            self.textSubView.textView.text = summary
            
            self.ingredientsView.tipsArray = ingredientsArr
            self.ingredientsView.collectionView.reloadData()
            
            print(name)
        }
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
            make.top.equalTo(boxView.snp.top).offset(-50)
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
