//
//  MainViewController.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 22.10.2021.
//


import UIKit
import BaseComponents

class MainViewController: BaseViewController<MainViewModel> {
    deinit {
        print("Deinitialized main view controller.")
    }
    
    private var mainComponent: CoinTableView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        //add coinListView
        addMainComponent()
        addViewModelListeners()
    }
    
    private func addMainComponent() {
        mainComponent = CoinTableView()
        mainComponent.translatesAutoresizingMaskIntoConstraints = false
        
        mainComponent.delegate = viewModel
        
        view.addSubview(mainComponent)
        
        NSLayoutConstraint.activate([
        
            mainComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainComponent.topAnchor.constraint(equalTo: view.topAnchor),
            mainComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
    private func addViewModelListeners() {
        viewModel.subscribeLoginState { [weak self] state in
            self?.userLoginStateHandler(with: state)
        }
        
        viewModel.subscribeViewState { [weak self] state in
            switch state {
            case .loading:
                return
            case .done:
                self?.mainComponent.reloadTableView()
            default:
                break
            }
        }
    }
    
    private func userLoginStateHandler(with value: Bool) {
        guard !value else { return }
        //present(LoginViewBuilder.build(), animated: true, completion: nil)
    }
    
    

}
