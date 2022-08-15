//
//  ReusableButton.swift
//  Destini-No-Storyboard
//
//  Created by Vianney Marcellin on 2022/08/15.
//

import Foundation
import UIKit

class ReusableButton: UIButton {
    
     init(type: UIButton.ButtonType, backgroundImage: String, text: String) {
         super.init(frame: .zero)
         
         self.setBackgroundImage(UIImage(named: backgroundImage), for: .normal)
         self.setTitle(text, for: .normal)
         self.tintColor = .white
         self.titleLabel?.font = .systemFont(ofSize: 23)
         self.titleLabel?.lineBreakMode = .byWordWrapping
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
