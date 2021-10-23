//
//  MainViewDataFormatterProtocol.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 22.10.2021.
//

import Foundation

protocol MainViewDataFormatterProtocol {

    var paginationData: PaginationInfo { get set }
    
    func getNumberOfSection() -> Int
    
    func getNumberOfItem(in section: Int) -> Int
    
    func setData(with response: CoinbaseLatestData)
    
    func getItem(at index: Int) -> GenericDataProtocol?
    
    func getCount() -> Int
    
    func getNumberOfItemsRetrieved() -> Int
}
