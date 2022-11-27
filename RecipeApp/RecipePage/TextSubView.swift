//
//  TextSubView.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 27.11.2022.
//

import Foundation
import UIKit
import SnapKit

class TextSubView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Интрукция"
        label.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        label.font = UIFont(name: "Avenir Next Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textView: UITextView = {
        var textView = UITextView()
        
        textView.text = "When the user taps in an editable text view, that text view becomes the first responder and automatically asks the system to display the associated keyboard. Because the appearance of the keyboard has the potential to obscure portions of your user interface, it’s up to you to make sure that doesn’t happen by repositioning any views that might be obscured. Some system views, like table views, help you by scrolling the first responder into view automatically. If the first responder is at the bottom of the scrolling region, however, you may still need to resize or reposition the scroll view itself to ensure the first responder is visible."
        
        textView.textColor = .black
        textView.font = UIFont(name: "Avenir Next", size: 15)
        textView.isEditable = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(titleLabel)
        addSubview(textView)
    }
    
    func setConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.right.equalToSuperview()
            make.height.equalTo(400)
        }
        
        
    }
    
}
