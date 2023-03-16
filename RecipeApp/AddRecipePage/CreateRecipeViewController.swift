

import UIKit
import SnapKit

class CreateRecipeViewController: UIViewController {
    
    var createRecipeLabel: UILabel!
    var productImageView: UIImageView!
    var nameTF: UITextField!
    var servesView: UIView!
    var cookTimeView: UIView!
    var ingredientsLabel: UILabel!
    var minusImageView: UIImageView!
    var ingredientQuantityTF: UITextField!
    var ingredientNameTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setLayout()

    }
    
    func setup() {
        createRecipeLabel = UILabel()
        createRecipeLabel.translatesAutoresizingMaskIntoConstraints = false
        createRecipeLabel.text = "Create recipe"
        createRecipeLabel.font = UIFont.poppins(24, weight: PoppinsWeight.bold)
        view.addSubview(createRecipeLabel)
        
        productImageView = UIImageView()
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.backgroundColor = .neutral10
        productImageView.layer.cornerRadius = 12
        view.addSubview(productImageView)
        
        nameTF = UITextField()
        nameTF.translatesAutoresizingMaskIntoConstraints = false
        nameTF.layer.borderWidth = 1
        nameTF.layer.cornerRadius = 10
        nameTF.layer.borderColor = UIColor.primary50?.cgColor
        nameTF.font = UIFont.poppins(14, weight: PoppinsWeight.regular)
        nameTF.textColor = UIColor.neutral100
        nameTF.indent(size: 15)
        view.addSubview(nameTF)
        
        servesView = UIView()
        servesView.translatesAutoresizingMaskIntoConstraints = false
        servesView.backgroundColor = UIColor.neutral10
        servesView.layer.cornerRadius = 12
        view.addSubview(servesView)
        
        cookTimeView = UIView()
        cookTimeView.translatesAutoresizingMaskIntoConstraints = false
        cookTimeView.backgroundColor = UIColor.neutral10
        cookTimeView.layer.cornerRadius = 12
        view.addSubview(cookTimeView)
        
        ingredientsLabel = UILabel()
        ingredientsLabel.text = "Ingredients"
        ingredientsLabel.font = UIFont.poppins(20, weight: PoppinsWeight.bold)
        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        ingredientsLabel.textColor = .neutral100
        view.addSubview(ingredientsLabel)
        
        minusImageView = UIImageView()
        minusImageView.translatesAutoresizingMaskIntoConstraints = false
        minusImageView.image = UIImage(named: "Minus-Border")
        view.addSubview(minusImageView)
        
        ingredientQuantityTF = UITextField()
        ingredientQuantityTF.translatesAutoresizingMaskIntoConstraints = false
        ingredientQuantityTF.layer.borderWidth = 1
        ingredientQuantityTF.layer.cornerRadius = 10
        ingredientQuantityTF.layer.borderColor = UIColor.neutral20?.cgColor
        ingredientQuantityTF.font = UIFont.poppins(14, weight: PoppinsWeight.regular)
        ingredientQuantityTF.textColor = UIColor.neutral100
        ingredientQuantityTF.indent(size: 15)
        ingredientQuantityTF.keyboardType = .numberPad
        view.addSubview(ingredientQuantityTF)
        
        ingredientNameTF = UITextField()
        ingredientNameTF.translatesAutoresizingMaskIntoConstraints = false
        ingredientNameTF.layer.borderWidth = 1
        ingredientNameTF.layer.cornerRadius = 10
        ingredientNameTF.layer.borderColor = UIColor.neutral20?.cgColor
        ingredientNameTF.font = UIFont.poppins(14, weight: PoppinsWeight.regular)
        ingredientNameTF.textColor = UIColor.neutral100
        ingredientNameTF.indent(size: 15)
        view.addSubview(ingredientNameTF)
        
    }
    
    func setLayout() {
        
        createRecipeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(96)
            make.leading.equalToSuperview().inset(19)
            make.centerX.equalToSuperview()
        }
        
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(createRecipeLabel).inset(44)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(200)
        }
        
        nameTF.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).inset(-16)
            make.centerX.equalToSuperview()
            make.leading.equalTo(productImageView.snp.leading)
            make.height.equalTo(44)
        }
        
        servesView.snp.makeConstraints { make in
            make.top.equalTo(nameTF.snp.bottom).inset(-15.6)
            make.centerX.equalToSuperview()
            make.leading.equalTo(productImageView.snp.leading)
            make.height.equalTo(60)
        }
        
        cookTimeView.snp.makeConstraints { make in
            make.top.equalTo(servesView.snp.bottom).inset(-15.6)
            make.centerX.equalToSuperview()
            make.leading.equalTo(productImageView.snp.leading)
            make.height.equalTo(60)
        }
        
        ingredientsLabel.snp.makeConstraints { make in
            make.top.equalTo(cookTimeView.snp.bottom).inset(-24.4)
            make.leading.equalTo(productImageView)
        }
        
        ingredientQuantityTF.snp.makeConstraints { make in
            make.top.equalTo(ingredientsLabel.snp.bottom).inset(-16)
            make.trailing.equalToSuperview().inset(68)
            make.height.equalTo(44)
            make.width.equalTo(115)
        }
        
        ingredientNameTF.snp.makeConstraints { make in
            make.centerY.equalTo(ingredientQuantityTF)
            make.trailing.equalTo(ingredientQuantityTF.snp.leading).inset(-12)
            make.leading.equalTo(productImageView)
            make.height.equalTo(44)
            make.width.equalTo(115)
        }
        
        minusImageView.snp.makeConstraints { make in
            make.leading.equalTo(ingredientQuantityTF.snp.trailing).inset(-12)
            make.centerY.equalTo(ingredientQuantityTF)
        }
        
    }
    
}
