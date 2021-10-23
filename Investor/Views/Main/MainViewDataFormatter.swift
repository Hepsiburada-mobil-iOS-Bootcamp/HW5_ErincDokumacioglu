//
//  MainViewDataFormatter.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 23.10.2021.
//

import Foundation

class MainViewDataFormatter: MainViewDataFormatterProtocol {
  
    var paginationData: PaginationInfo = PaginationInfo()
    
    private var componentData: CoinbaseLatestData?
    private var list: [Datum] = [Datum]()
    

    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        let count = list.count
        return (paginationData.limit <= getNumberOfItemsRetrieved() ? count + 1 : count)
    }
    
    func setData(with response: CoinbaseLatestData) {
        componentData = response
        list.append(contentsOf: response.data!)
    }
    
    // TODO: - Force unwrapping might not be a very wise action.
    func getItem(at index: Int) -> GenericDataProtocol? {
        let item = list[index]
        return CoinCellViewData(coinNameData: item.name!,
                                changeData: String(item.quote!["USD"]!.percentChange1H!),
                                valueData: String(item.quote!["USD"]!.price!),
                                dateData: item.lastUpdated!)
    }
    
    func getCount() -> Int {
        return list.count
    }
    
    func getNumberOfItemsRetrieved() -> Int {
        guard let data = componentData?.data else { return 0 }
        return data.count
    }
}
