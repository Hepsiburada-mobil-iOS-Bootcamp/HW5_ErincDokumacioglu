//
//  CoinCellViewData.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 22.10.2021.
//

import Foundation

class CoinCellViewData: GenericDataProtocol {
    var type: GenericRowType?
    
    private(set) var coinNameData: String
    private(set) var changeData: String
    private(set) var valueData: String
    private(set) var dateData: String
    
    init(coinNameData: String, changeData: String, valueData: String, dateData: String) {
        self.coinNameData = coinNameData
        self.changeData = changeData
        self.valueData = valueData
        self.dateData = dateData
    }
}
