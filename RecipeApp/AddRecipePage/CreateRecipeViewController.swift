

import UIKit
import SnapKit

class CreateRecipeViewController: UIViewController {
    
    var createRecipeLabel: UILabel!
    var productImageView: UIImageView!
    var editImageView: UIImageView!
    var nameTF: UITextField!
    var servesView: UIView!
    var servesImageView: UIImageView!
    var servesLabel: UILabel!
    var servesQuantityLabel: UILabel!
    var servesArrowImageView: UIImageView!
    var cookTimeView: UIView!
    var cookTimeImageView: UIImageView!
    var cookTimeLabel: UILabel!
    var cookTimeDurationLabel: UILabel!
    var cookTimeArrowImageView: UIImageView!
    var ingredientsLabel: UILabel!
    var minusImageView: UIImageView!
    var ingredientQuantityTF: UITextField!
    var ingredientNameTF: UITextField!
    var plusIngerientImageView: UIImageView!
    var addLabel: UILabel!
    var createRecipeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
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
        
        editImageView = UIImageView(image: UIImage(named: "Edit"))
        editImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.addSubview(editImageView)
        
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
        
        servesImageView = UIImageView()
        servesImageView.translatesAutoresizingMaskIntoConstraints = false
        servesImageView.image = UIImage(named: "servesQuantityIcon")
        servesView.addSubview(servesImageView)
        
        servesLabel = UILabel()
        servesLabel.translatesAutoresizingMaskIntoConstraints = false
        servesLabel.text = "Serves"
        servesLabel.font = .poppins(16, weight: .bold)
        servesLabel.textColor = .neutral100
        servesView.addSubview(servesLabel)
        
        servesQuantityLabel = UILabel()
        servesQuantityLabel.translatesAutoresizingMaskIntoConstraints = false
        servesQuantityLabel.text = "03"
        servesQuantityLabel.font = .poppins(14, weight: .regular)
        servesQuantityLabel.textColor = .neutral50
        servesView.addSubview(servesQuantityLabel)
        
        servesArrowImageView = UIImageView()
        servesArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        servesArrowImageView.image = UIImage(named: "ArrowRightIcon")
        servesView.addSubview(servesArrowImageView)
        
        cookTimeView = UIView()
        cookTimeView.translatesAutoresizingMaskIntoConstraints = false
        cookTimeView.backgroundColor = UIColor.neutral10
        cookTimeView.layer.cornerRadius = 12
        view.addSubview(cookTimeView)
        
        cookTimeImageView = UIImageView(image: UIImage(named: "cookTimeIcon"))
        cookTimeImageView.translatesAutoresizingMaskIntoConstraints = false
        cookTimeView.addSubview(cookTimeImageView)
                                        
        cookTimeLabel = UILabel()
        cookTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        cookTimeLabel.text = "Cook time"
        cookTimeLabel.font = .poppins(16, weight: .bold)
        cookTimeLabel.textColor = .neutral100
        cookTimeView.addSubview(cookTimeLabel)
        
        cookTimeDurationLabel = UILabel()
        cookTimeDurationLabel.translatesAutoresizingMaskIntoConstraints = false
        cookTimeDurationLabel.text = "20 min"
        cookTimeDurationLabel.font = .poppins(14, weight: .regular)
        cookTimeDurationLabel.textColor = .neutral50
        cookTimeView.addSubview(cookTimeDurationLabel)
        
        cookTimeArrowImageView = UIImageView(image: UIImage(named: "ArrowRightIcon"))
        cookTimeArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        cookTimeView.addSubview(cookTimeArrowImageView)
        
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
        
        plusIngerientImageView = UIImageView()
        plusIngerientImageView.translatesAutoresizingMaskIntoConstraints = false
        plusIngerientImageView.image = UIImage(named: "Union")
        view.addSubview(plusIngerientImageView)
        
        addLabel = UILabel()
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        addLabel.text = "Add new ingredient"
        addLabel.font = .poppins(16, weight: .bold)
        addLabel.textColor = .neutral100
        view.addSubview(addLabel)
        
        createRecipeButton = UIButton(type: .system)
        createRecipeButton.translatesAutoresizingMaskIntoConstraints = false
        createRecipeButton.setTitle("Create recipe", for: .normal)
        createRecipeButton.tintColor = .white
        createRecipeButton.layer.cornerRadius = 8
        createRecipeButton.backgroundColor = .primary50
        view.addSubview(createRecipeButton)
        
        
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
        
        editImageView.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(0)
            make.width.equalTo(72)
            make.height.equalTo(80)
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
        
        servesImageView.snp.makeConstraints { make in
            make.height.width.equalTo(36)
            make.leading.equalTo(servesView).inset(16)
            make.centerY.equalToSuperview()
        }
        servesLabel.snp.makeConstraints { make in
            make.leading.equalTo(servesImageView.snp.trailing).inset(-16)
            make.centerY.equalToSuperview()
        }
        
        servesArrowImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
            make.trailing.equalToSuperview().inset(16)
        }
        
        servesQuantityLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(servesArrowImageView.snp.leading).inset(-8)
        }
        
        
        cookTimeView.snp.makeConstraints { make in
            make.top.equalTo(servesView.snp.bottom).inset(-15.6)
            make.centerX.equalToSuperview()
            make.leading.equalTo(productImageView.snp.leading)
            make.height.equalTo(60)
        }
        
        cookTimeImageView.snp.makeConstraints { make in
            make.height.width.equalTo(36)
            make.leading.equalTo(cookTimeView).inset(16)
            make.centerY.equalToSuperview()
        }
        cookTimeLabel.snp.makeConstraints { make in
            make.leading.equalTo(cookTimeView.snp.trailing).inset(-16)
            make.centerY.equalToSuperview()
        }
        
        cookTimeArrowImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
            make.trailing.equalToSuperview().inset(16)
        }
        
        cookTimeDurationLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(cookTimeArrowImageView.snp.leading).inset(-8)
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
        
        plusIngerientImageView.snp.makeConstraints { make in
            make.top.equalTo(ingredientQuantityTF.snp.bottom).inset(-19.6)
            make.leading.equalTo(productImageView)
            make.height.equalTo(24)
            make.width.equalTo(plusIngerientImageView.snp.height)
        }
        
        addLabel.snp.makeConstraints { make in
            make.leading.equalTo(plusIngerientImageView.snp.trailing).inset(-8)
            make.centerY.equalTo(plusIngerientImageView)
        }
        
        createRecipeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalTo(productImageView)
            make.height.equalTo(56)
            make.top.equalTo(addLabel.snp.bottom).inset(-58.2)
        }
        
    }
    
}
