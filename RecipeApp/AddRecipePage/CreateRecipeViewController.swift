

import UIKit
import SnapKit

class CreateRecipeViewController: UIViewController {
    
    var createRecipeLabel: UILabel!
    var productImageView: UIImageView!
    var nameTF: UITextField!
    var servesView: UIView!
    var cookTimeView: UIView!

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
        
    }
    
}