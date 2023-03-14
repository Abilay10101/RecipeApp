import UIKit

extension UIFont {
    static func poppins(_ size: CGFloat, weight: PoppinsWeight) -> UIFont? {
        UIFont(name: weight.rawValue, size: size)
    }
}

enum PoppinsWeight: String {
    case bold = "Poppins-Bold"
    case semibold = "Poppins-SemiBold"
    case regular = "Poppins-Regular"
}
