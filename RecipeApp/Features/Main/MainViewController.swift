import UIKit

final class MainViewController: UIViewController {
    let label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "CookBook"
        label.font = .poppins(20, weight: .bold)
        label.textColor = .primary50
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        view.addSubview(label)
        view.backgroundColor = .systemBackground
            
        label.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
