//
//  CoinTableHeaderView.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 24.10.2021.
//

import UIKit
import BaseComponents

class CoinTableHeaderView: BaseView{
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.clipsToBounds = true
        temp.backgroundColor = .white
        
        return temp
    }()
    
    private lazy var headerStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [coinNameLabel, changeLabel, valueLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .horizontal
        
        return temp
    }()
    
    private lazy var coinNameLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.textColor = .black
        temp.text = "Coin Name"
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 2
        temp.contentMode = .center
        temp.textAlignment = .center
        temp.font = FontManager.medium(18).value
        
        return temp
    }()
    
    private lazy var changeLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.textColor = .black
        temp.text = "Change in 1H"
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 2
        temp.contentMode = .center
        temp.textAlignment = .center
        temp.font = FontManager.medium(18).value
        
        return temp
    }()
    
    private lazy var valueLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.textColor = .black
        temp.text = "Value ($) "
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 2
        temp.contentMode = .center
        temp.textAlignment = .center
        temp.font = FontManager.medium(18).value
        
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addContainerView()
    }
    
    private func addContainerView() {
        addSubview(containerView)
        containerView.addSubview(headerStackView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            headerStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            headerStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            headerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            headerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
        ])
    }
}
