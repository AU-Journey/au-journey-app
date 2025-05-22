//
//  ViewController.swift
//  AU Journey
//
//  Created by Beau on 19/5/2568 BE.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
//    let loginView = LoginView()
    let logoImageView = UIImageView()
    let appNameLabel = UILabel()
    let appDescriptionLabel = UILabel()
    let signInButton = UIButton(type: .system)
    let backgroundImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        // LoginView
//        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        // logoImageView
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "JourneyLogo")
        logoImageView.layer.cornerRadius = 20
        logoImageView.clipsToBounds = true
        
        // AppNameLabel
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        appNameLabel.font = UIFont(name: "Outfit-Medium", size: 38)
//        appNameLabel.font = .systemFont(ofSize: 42, weight: .bold)
        appNameLabel.textColor = .white
        appNameLabel.textAlignment = .center
        appNameLabel.text = "AU Journey"
        
        // AppDescriptionLabel
        appDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        appDescriptionLabel.font = UIFont(name: "Outfit-Regular", size: 18)
//        appDescriptionLabel.font = .systemFont(ofSize: 17, weight: .regular)
        appDescriptionLabel.textColor = .white
        appDescriptionLabel.textAlignment = .center
        appDescriptionLabel.numberOfLines = 0
        appDescriptionLabel.text = "An application that will help guide your way in Assumption University, made for students and faculty members."
        
        // SignInButton
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.tintColor = .black
        signInButton.configuration?.imagePadding = 8
        signInButton.configuration?.buttonSize = .large
        signInButton.setTitle("Continue with Microsoft", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        // backgroundImageView
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.image = UIImage(named: "BackgroundOpening")
        backgroundImageView.contentMode = .scaleAspectFill
        
        layout()
    }
    
    private func layout() {
//        view.addSubview(loginView)
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(logoImageView)
        view.addSubview(appNameLabel)
        view.addSubview(appDescriptionLabel)
        view.addSubview(signInButton)
        
        // LoginView
//        NSLayoutConstraint.activate([
//            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
//            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
//            ])
        
        
        // logoImageView
        NSLayoutConstraint.activate([
            logoImageView.bottomAnchor.constraint(equalTo: appNameLabel.topAnchor, constant: -50),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])

        
        // appNameLabel
        NSLayoutConstraint.activate([
            appNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80),
            appNameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: appNameLabel.trailingAnchor, multiplier: 3)
            ])
        
        // appDescriptionLabel
        NSLayoutConstraint.activate([
            appDescriptionLabel.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: 20),
            appDescriptionLabel.leadingAnchor.constraint(equalTo: appNameLabel.leadingAnchor),
            appDescriptionLabel.trailingAnchor.constraint(equalTo: appNameLabel.trailingAnchor)
            ])
        
        // signInButton
        NSLayoutConstraint.activate([
            signInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 2)
            ])
        
        // backgroundImageView
    NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    
    }
}

extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        
    }
}
