//
//  PlaceholderView.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 24.10.2021.
//

import Foundation
import BaseComponents
import UIKit

class PlaceholderView: BaseView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [image, infoView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .fill
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 20
        return temp
    }()
    
    private lazy var image: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.image = ImageManager.login.value
        temp.heightAnchor.constraint(equalToConstant: 300).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 300).isActive = true
        temp.clipsToBounds = true
        
        return temp
    }()
    
    private lazy var infoView: LabelPackComponent = {
        let temp = LabelPackComponent(data: getLabelPackComponentData())
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    func activationManager(by value: Bool) {
        isHidden = !value
    }
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
        
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            mainStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        
        ])
    }
    
    private func getLabelPackComponentData() -> LabelPackComponentData {
        return LabelPackComponentData(title: "Please login", subTitle: "Please login from account section to view latest cryptocurrency data.")
            .setSubTitleLabelDistributionData(by: LabelDistributionData().setContentMode(by: .center).setTextAlignment(by: .center).setNumberOfLines(by: 2).setLineBreakMode(by: .byTruncatingTail).setFont(by: FontManager.regular(16).value))
            .setTitleLabelDistributionData(by: LabelDistributionData().setContentMode(by: .center).setTextAlignment(by: .center).setNumberOfLines(by: 1).setLineBreakMode(by: .byTruncatingTail).setFont(by: FontManager.bold(24).value))
            .setSpacing(by: 10)
            .setStackViewAlignment(by: .fill)
    }
}
