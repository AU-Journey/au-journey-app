//
//  TabBarController.swift
//  AU Journey
//
//  Created by Beau on 22/5/2568 BE.
//

//import UIKit
//import SnapKit
//
//final class TabBarController: UITabBarController {
//    private let homeVC = HomeViewController()
//    private let mapVC = MapViewController()
//    private let profileVC = ProfileViewController()
//    private let tabBarView = TabBarView(frame: .zero)
//    
//    private lazy var homeBarButtonItem: UIBarButtonItem = {
//        let barButtonItem = UIBarButtonItem(
//            title: "Home",
//            style: .plain,
//            target: self,
//            action: #selector(didTappedBarButton))
//        barButtonItem.tintColor = .white
//        return barButtonItem
//    } ()
//    
//    private lazy var mapBarButtonItem: UIBarButtonItem = {
//        let barButtonItem = UIBarButtonItem(
//            title: "Map",
//            style: .plain,
//            target: self,
//            action: #selector(didTappedBarButton))
//        barButtonItem.tintColor = .white
//        return barButtonItem
//    } ()
//    
//    private lazy var profileBarButtonItem: UIBarButtonItem = {
//        let barButtonItem = UIBarButtonItem(
//            title: "Profile",
//            style: .plain,
//            target: self,
//            action: #selector(didTappedBarButton))
//        barButtonItem.tintColor = .white
//        return barButtonItem
//    } ()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        configure()
//        tabbarLayout()
//        configTabBarButton()
//        }
//    }
//
//private extension TabBarController {
//    func configure() {
//        // add some functions
//    }
//    
//    func tabbarLayout() {
//        view.addSubview(tabBarView)
//        
//        tabBarView.snp.makeConstraints {
//            $0.center.equalToSuperview()
//            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
//            $0.width.equalTo(280)
//            $0.height.equalTo(65)
//        }
//    }
//    
//    func configTabBarButton() {
//
//        tabBarView.homeButton.addTarget(
//            self,
//            action: #selector(didTappedHome),
//            for: .touchUpInside)
//        
//        tabBarView.mapButton.addTarget(
//            self,
//            action: #selector(didTappedMap),
//            for: .touchUpInside)
//        
//        tabBarView.profileButton.addTarget(
//            self,
//            action: #selector(didTappedProfile),
//            for: .touchUpInside)
//    }
//    
//    func changeTintColor(buttonType: UIButton) {
//        tabBarView.homeButton.tintColor = (buttonType == tabBarView.homeButton) ? .systemRed : .systemGray
//        tabBarView.mapButton.tintColor = (buttonType == tabBarView.mapButton) ? .systemRed : .systemGray
//        tabBarView.profileButton.tintColor = (buttonType == tabBarView.profileButton) ? .systemRed : .systemGray
//    }
//    
//    @objc func didTappedHome() {
////        navigationItem.title = "Home"
//        navigationItem.rightBarButtonItem = homeBarButtonItem
//        selectedIndex = 0
//        
//        changeTintColor(buttonType: tabBarView.homeButton)
//    }
//    
//    @objc func didTappedMap() {
//        navigationItem.rightBarButtonItem = mapBarButtonItem
//        selectedIndex = 1
//        
//        changeTintColor(buttonType: tabBarView.mapButton)
//    }
//    
//    @objc func didTappedProfile() {
//        navigationItem.rightBarButtonItem = profileBarButtonItem
//        selectedIndex = 2
//        
//        changeTintColor(buttonType: tabBarView.profileButton)
//    }
//    
//    @objc func didTappedBarButton() {
//        
//    }
//    
//}

import UIKit
import SnapKit

final class TabBarController: UITabBarController {
    // Your destination view controllers
    private let homeVC = HomeViewController()
    private let mapVC = MapViewController()
    private let profileVC = ProfileViewController()
    
    // Your custom tab bar view
    private let tabBarView = TabBarView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Set your view controllers
        self.viewControllers = [homeVC, mapVC, profileVC]
        
        // Hide default tab bar
        self.tabBar.isHidden = true
        
        // Layout custom tab bar
        configure()
        tabbarLayout()
        configTabBarButton()
        
        // Set initial selected button appearance
        changeTintColor(buttonType: tabBarView.homeButton)
    }
}

private extension TabBarController {
    func configure() {
        // Add your custom tab bar view
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
