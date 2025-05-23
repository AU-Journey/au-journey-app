//
//  TabBarController.swift
//  AU Journey
//
//  Created by Beau on 22/5/2568 BE.
//

import UIKit
import SnapKit

final class TabBarController: UITabBarController {
    private let homeVC = HomeViewController()
    private let mapVC = MapViewController()
    private let profileVC = ProfileViewController()
    
    private let tabBarView = TabBarView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.viewControllers = [homeVC, mapVC, profileVC]
        
        self.tabBar.isHidden = true
        
        configure()
        tabbarLayout()
        configTabBarButton()
        
        changeTintColor(buttonType: tabBarView.homeButton)
    }
}

private extension TabBarController {
    func configure() {
        view.addSubview(tabBarView)
    }
    
    func tabbarLayout() {
        tabBarView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.width.equalTo(280)
            $0.height.equalTo(65)
        }
    }
    
    func configTabBarButton() {
        // Assign actions to custom buttons
        tabBarView.homeButton.addTarget(self, action: #selector(didTappedHome), for: .touchUpInside)
        tabBarView.mapButton.addTarget(self, action: #selector(didTappedMap), for: .touchUpInside)
        tabBarView.profileButton.addTarget(self, action: #selector(didTappedProfile), for: .touchUpInside)
    }
    
    func changeTintColor(buttonType: UIButton) {
        // Highlight the selected button
        tabBarView.homeButton.tintColor = (buttonType == tabBarView.homeButton) ? .systemRed : .systemGray
        tabBarView.mapButton.tintColor = (buttonType == tabBarView.mapButton) ? .systemRed : .systemGray
        tabBarView.profileButton.tintColor = (buttonType == tabBarView.profileButton) ? .systemRed : .systemGray
    }
    
    @objc func didTappedHome() {
        selectedIndex = 0
        changeTintColor(buttonType: tabBarView.homeButton)
    }

    @objc func didTappedMap() {
        selectedIndex = 1
        changeTintColor(buttonType: tabBarView.mapButton)
    }

    @objc func didTappedProfile() {
        selectedIndex = 2
        changeTintColor(buttonType: tabBarView.profileButton)
    }
}
