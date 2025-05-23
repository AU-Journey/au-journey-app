//
//  TabBarView.swift
//  AU Journey
//
//  Created by Beau on 22/5/2568 BE.
//

//import UIKit
//import SnapKit
//
//final class TabBarView: UIView {
//    
//    lazy var homeButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setImage(UIImage(systemName: "house"), for: .normal)
//        button.tintColor = .systemGray
//        return button
//    } ()
//    
//    lazy var mapButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setImage(UIImage(systemName: "map"), for: .normal)
//        button.tintColor = .systemGray
//        return button
//    } ()
//    
//    lazy var profileButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setImage(UIImage(systemName: "person.fill"), for: .normal)
//        button.tintColor = .systemGray
//        return button
//    } ()
//    
//    private lazy var buttonStackView: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .horizontal
//        stack.alignment = .fill
//        stack.distribution = .fillEqually
//        
//        stack.backgroundColor = .white
//        stack.layer.cornerRadius = 30
//        
//        stack.layer.shadowColor = UIColor.black.cgColor
//        stack.layer.shadowOffset = CGSize(width: 0, height: 2)
//        stack.layer.shadowOpacity = 0.1
//        stack.layer.shadowRadius = 4
//        
//        [homeButton,mapButton,profileButton].forEach {
//            stack.addArrangedSubview($0)
//        }
//        return stack
//    } ()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        tabbarLayout()
//    }
//    
//    private func tabbarLayout() {
//        self.addSubview(buttonStackView)
//        
//        buttonStackView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}

import UIKit
import SnapKit

final class TabBarView: UIView {
    
    lazy var homeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "house"), for: .normal)
        button.tintColor = .systemGray
        return button
    }()
    
    lazy var mapButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "map"), for: .normal)
        button.tintColor = .systemGray
        return button
    }()
    
    lazy var profileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "person.fill"), for: .normal)
        button.tintColor = .systemGray
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.backgroundColor = .white
        stack.layer.cornerRadius = 30
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOffset = CGSize(width: 0, height: 2)
        stack.layer.shadowOpacity = 0.1
        stack.layer.shadowRadius = 4
        
        [homeButton, mapButton, profileButton].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = .clear
        addSubview(buttonStackView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        // Using SnapKit to make constraints fill the superview
        buttonStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
