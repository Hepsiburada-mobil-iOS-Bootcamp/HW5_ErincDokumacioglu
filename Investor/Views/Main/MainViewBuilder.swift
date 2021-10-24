//
//  MainViewBuilder.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 23.10.2021.
//

import UIKit

class MainViewBuilder {
    class func build() -> UIViewController {
        let authManager = AuthenticationManager.shared
        let formatter = MainViewDataFormatter()
        let viewModel = MainViewModel(formatter: formatter,
                                      authManager: authManager)
        let viewController = MainViewController(viewModel: viewModel)
        
        let navigationViewController = UINavigationController(rootViewController: viewController)
        viewController.title = "Coin Data"
        viewController.tabBarItem.image = TabBarImageManager.home.value
        viewController.tabBarItem.selectedImage = TabBarImageManager.homeSelected.value
        viewController.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        viewController.navigationController?.navigationBar.standardAppearance = appearance;
        viewController.navigationController?.navigationBar.scrollEdgeAppearance = viewController.navigationController?.navigationBar.standardAppearance
        
        return navigationViewController
    }
}
