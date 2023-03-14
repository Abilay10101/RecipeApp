import UIKit

class RecentRecipeCollectionViewCell: UICollectionViewCell, SelfConfiguringCell {
    static let id = "RecentRecipeCollectionViewCell"
    
    func configure(with recipe: Recipe) {
        contentView.backgroundColor = .blue
    }
}
