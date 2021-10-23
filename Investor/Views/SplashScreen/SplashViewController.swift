//
//  SplashViewController.swift
//  WeatherApplication
//
//  Created by Erkut Bas on 16.10.2021.
//

import Foundation
import UIKit
import BaseComponents

class SplashViewController: BaseViewController<SplashViewModel> {
    
    private lazy var image: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.isUserInteractionEnabled = false
        temp.image = ImageManager.splashImage.value
        temp.contentMode = .scaleAspectFill
        
        return temp
    }()
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        appendComponents()
        viewModel.fireApplicationInitiateProcess()
    }
    
    private func appendComponents() {
        view.backgroundColor = .white
        view.addSubview(image)
        
        NSLayoutConstraint.activate([
        
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            
        ])
    }
    
}
