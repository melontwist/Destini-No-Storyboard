//
//  ViewController.swift
//  Destini-No-Storyboard
//
//  Created by Vianney Marcellin on 2022/08/15.
//

import UIKit

class ViewController: UIViewController {
    
    var mainView: MainView!
    
    var storyBrain = StoryBrain()
    
    override func loadView() {
        super.loadView()
        self.mainView = MainView(frame: .zero)
        self.view = self.mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [mainView.firstButton,mainView.secondButton].forEach {
            $0.addTarget(self, action: #selector(choiceMade), for: .touchUpInside)
        }
        updateUI()
    }
    
    @objc func choiceMade(_ sender: UIButton){
        if storyBrain.isFinished() {
            showAlert()
        } else {
            storyBrain.nextStory(userChoice: sender.currentTitle!)
            updateUI()
        }
    }
    
    func updateUI(){
        mainView.questionLabel.text = storyBrain.getStoryTitle()
        mainView.firstButton.setTitle(storyBrain.getChoice1(), for: .normal)
        mainView.secondButton.setTitle(storyBrain.getChoice2(), for: .normal)
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "The End", message: "The story is finished.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
            self.storyBrain.restartStory()
            self.updateUI()
        }))
        
        present(alert, animated: true)
        
    }
}

