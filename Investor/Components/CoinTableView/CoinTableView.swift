//
//  CoinTableView.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 22.10.2021.
//

import UIKit
import BaseComponents

class CoinTableView: BaseView {
    
    deinit {
        print("Deinitialized CoinTableView.")
    }
    
    weak var delegate: CoinTableViewProtocol?
    
    private lazy var tableView: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.delegate = self
        temp.dataSource = self
        temp.estimatedRowHeight = UITableView.automaticDimension
        temp.separatorStyle = .none
        temp.contentInsetAdjustmentBehavior = .never
        temp.register(CoinCellView.self, forCellReuseIdentifier: CoinCellView.identifier)
        
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        
        addTableView()
    }
    
    private func addTableView() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return delegate?.isLoadingCell(for: indexPath.row) ?? false
    }
}


extension CoinTableView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return delegate?.askNumberOfSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.askNumberOfItem(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = delegate?.askData(at: indexPath.row) else { fatalError("Please provide data") }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinCellView.identifier, for: indexPath) as? CoinCellView else { return UITableViewCell() }
        
        cell.setData(by: data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if isLoadingCell(for: indexPath) {
            delegate?.getMoreData()
        }
    }
    
    
}


