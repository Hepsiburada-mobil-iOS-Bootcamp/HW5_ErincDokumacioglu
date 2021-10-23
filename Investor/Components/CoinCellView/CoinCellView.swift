//
//  CoinCellView.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 22.10.2021.
//

import UIKit
import BaseComponents

class CoinCellView: BaseTableViewCell {
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.clipsToBounds = true
        temp.backgroundColor = .white
        
        return temp
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [coinDataStackView, dateLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 10
        
        return temp
    }()
    
    private lazy var coinDataStackView: UIStackView = {
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
        temp.text = " "
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.textAlignment = .center
        temp.font = FontManager.medium(16).value
        
        return temp
    }()
    
    private lazy var changeLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.textColor = .green
        temp.text = " "
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.textAlignment = .center
        temp.font = FontManager.regular(16).value
        
        return temp
    }()
    
    private lazy var valueLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.textColor = .black
        temp.text = " "
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.textAlignment = .center
        temp.font = FontManager.bold(16).value
        
        return temp
    }()
    
    private lazy var dateLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.textColor = .gray
        temp.text = " "
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.textAlignment = .center
        temp.font = FontManager.light(13).value
        
        return temp
    }()
    
    
    override func addMajorView() {
        super.addMajorView()
        
        addComponents()
    }
    
    func setData(by value: GenericDataProtocol) {
        guard let data = value as? CoinCellViewData else { return }
        coinNameLabel.text = data.coinNameData
        valueLabel.text = data.valueData
        changeLabel.text = data.changeData
        dateLabel.text = data.dateData
    }
    
    // MARK: - Private functions
    private func addComponents() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }
}
