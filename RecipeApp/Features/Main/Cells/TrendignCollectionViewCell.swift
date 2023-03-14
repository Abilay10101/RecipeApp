import UIKit

class TrendignCollectionViewCell: UICollectionViewCell, SelfConfiguringCell {
    static let id = "TrendignCollectionViewCell"
    
    func configure(with recipe: Recipe) {
        contentView.backgroundColor = .red
    }
}
