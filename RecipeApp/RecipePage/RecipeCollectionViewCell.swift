
import UIKit
import SnapKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    var recipe: RecipeStr? {
        didSet {
            guard let image = recipe?.image else { return }
            guard let name = recipe?.name else { return }
            
            
            nameLabel.text = name
            
            DispatchQueue.global().async {
                guard let imageUrl = URL(string: image) else { return }
                guard let imageData = try? Data(contentsOf: imageUrl) else { return }
                
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: imageData)
                }
            }
        }
    }
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        setCellShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = .secondarySystemBackground
        
        addSubview(imageView)
        addSubview(nameLabel)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(nameLabel.snp.top)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
    
    func setCellShadow() {
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 3.0
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        self.layer.cornerRadius = 20
        
    }
    
    
}
