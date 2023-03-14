import UIKit

class PopularRecipeCollectionViewCell: UICollectionViewCell, SelfConfiguringCell {
    static let id = "PopularRecipeCollectionViewCell"
    
    func configure(with recipe: Recipe) {
        contentView.backgroundColor = .green
    }
}
