//
//  ViewController.swift
//  AU Journey
//
//  Created by Beau on 19/5/2568 BE.
//

import UIKit

class LoginViewController: UIViewController {
    
//    let loginView = LoginView()
    let AppNameLabel = UILabel()
    let AppDescriptionLabel = UILabel()
    let signInButton = UIButton(type: .system)

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
        
        // AppNameLabel
        AppNameLabel.translatesAutoresizingMaskIntoConstraints = false
        AppNameLabel.font = .systemFont(ofSize: 32, weight: .bold)
        AppNameLabel.textColor = .label
        AppNameLabel.textAlignment = .center
        AppNameLabel.text = "AU Journey"
        
        // AppDescriptionLabel
        AppDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        AppDescriptionLabel.font = .systemFont(ofSize: 17, weight: .regular)
        AppDescriptionLabel.textColor = .secondaryLabel
        AppDescriptionLabel.textAlignment = .center
        AppDescriptionLabel.numberOfLines = 0
        AppDescriptionLabel.text = "An application that will help guide your way in Assumption University, made for students and faculty members."
        
        // SignInButton
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.tintColor = .systemPink
        signInButton.configuration?.imagePadding = 8
        signInButton.configuration?.buttonSize = .large
        signInButton.setTitle("Continue with Microsoft", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
    }
    
    private func layout() {
//        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(AppNameLabel)
        view.addSubview(AppDescriptionLabel)
        
        // LoginView
//        NSLayoutConstraint.activate([
//            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
//            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
//            ])
        
        // AppNameLabel
        NSLayoutConstraint.activate([
            AppNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            AppNameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: AppNameLabel.trailingAnchor, multiplier: 2)
            ])
        
        // AppDescriptionLabel
        NSLayoutConstraint.activate([
            AppDescriptionLabel.topAnchor.constraint(equalTo: AppNameLabel.bottomAnchor, constant: 10),
            AppDescriptionLabel.leadingAnchor.constraint(equalTo: AppNameLabel.leadingAnchor),
            AppDescriptionLabel.trailingAnchor.constraint(equalTo: AppNameLabel.trailingAnchor)
            ])
        
        // SignInButton
        NSLayoutConstraint.activate([
            signInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 2)
            ])
    }
}

extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        
    }
}
