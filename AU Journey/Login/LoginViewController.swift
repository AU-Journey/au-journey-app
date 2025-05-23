//
//  ViewController.swift
//  AU Journey
//
//  Created by Beau on 19/5/2568 BE.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    let logoImageView = UIImageView()
    let appNameLabel = UILabel()
    let appDescriptionLabel = UILabel()
    let signInButton = UIButton(type: .system)
    let backgroundImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        AuthManager.shared.setup()
    }
}

extension LoginViewController {
    private func style() {
        
        // logoImageView
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "JourneyLogo")
        logoImageView.layer.cornerRadius = 20
        logoImageView.clipsToBounds = true
        
        // AppNameLabel
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        appNameLabel.font = UIFont(name: "Outfit-Medium", size: 38)
        appNameLabel.textColor = .white
        appNameLabel.textAlignment = .center
        appNameLabel.text = "AU Journey"
        
        // AppDescriptionLabel
        appDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        appDescriptionLabel.font = UIFont(name: "Outfit-Regular", size: 18)
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
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        view.addSubview(logoImageView)
        view.addSubview(appNameLabel)
        view.addSubview(appDescriptionLabel)
        view.addSubview(signInButton)
        
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
        AuthManager.shared.signIn(presentingViewController: self) { token in
            if let token = token {
                print(" Signed in with token: \(token)")
                
                //  Transition to main app screen
                DispatchQueue.main.async {
                    let homeVC = TabBarController()
                    homeVC.modalPresentationStyle = .fullScreen
                    self.present(homeVC, animated: true)
                }

            } else {
                print(" Sign-in failed.")
                let alert = UIAlertController(title: "Login Failed", message: "Please try again.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
            }
        }
    }
}

