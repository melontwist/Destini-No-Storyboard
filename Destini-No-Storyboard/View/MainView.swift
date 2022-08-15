//
//  MainView.swift
//  Destini-No-Storyboard
//
//  Created by Vianney Marcellin on 2022/08/15.
//

import Foundation
import UIKit

class MainView: UIView {
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Story Text"
        label.textColor = .white
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .left
        label.baselineAdjustment = .alignBaselines
        label.numberOfLines = 0
        
        return label
    }()
    
    let firstButton = ReusableButton(type: .system, backgroundImage: "choice1Background", text: "Choice 1")
    let secondButton = ReusableButton(type: .system, backgroundImage: "choice2Background", text: "Choice 2")
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [questionLabel, firstButton, secondButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 20
        stack.contentMode = .scaleToFill
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setComponent()
        setConstraint()
    }
    
    
    private func setComponent(){
        [backgroundImage, stackView].forEach {
            addSubview($0)
        }
    }
    
    private func setConstraint(){
        NSLayoutConstraint.activate([
            
            //Constraints for the background image
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            firstButton.heightAnchor.constraint(equalToConstant: 100),
            secondButton.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
