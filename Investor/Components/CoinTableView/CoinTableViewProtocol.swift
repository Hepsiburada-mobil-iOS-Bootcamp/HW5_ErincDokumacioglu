//
//  CoinTableViewData.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 22.10.2021.
//

import Foundation

protocol CoinTableViewProtocol: AnyObject {
    func askNumberOfSection() -> Int
    func askNumberOfItem(in section: Int) -> Int
    func askData(at index: Int) -> GenericDataProtocol?
    func isLoadingCell(for index: Int) -> Bool
    func getMoreData()
}


