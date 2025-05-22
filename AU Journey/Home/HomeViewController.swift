//
//  HomeViewController.swift
//  AU Journey
//
//  Created by Beau on 22/5/2568 BE.
//

import UIKit

class HomeViewController: UIViewController {
    
    let userGreetingsLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
    }
}

extension HomeViewController {
    private func style() {
        
        // userGreetingsLabel
        userGreetingsLabel.translatesAutoresizingMaskIntoConstraints = false
        userGreetingsLabel.font = UIFont(name: "Outfit-Medium", size: 24)
        userGreetingsLabel.textColor = .black
        userGreetingsLabel.textAlignment = .center
        userGreetingsLabel.text = "Hello, Beau!"
        
    }
    
    private func layout() {
        view.addSubview(userGreetingsLabel)
        
        // userGreetingsLabel
        NSLayoutConstraint.activate([
            userGreetingsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            userGreetingsLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: userGreetingsLabel.trailingAnchor, multiplier: 2)
        ])
                                                         
    }
}
