//
//  PaginationInfo.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 23.10.2021.
//

import Foundation

struct PaginationInfo {
    var limit: Int = 20
    var offset: Int = 1
    var fetching: Bool = false
    
    func checkLoadingMore(with currentDataSize: Int) -> Bool {
        return (limit <= currentDataSize) && !fetching
    }
    
    mutating func nextOffset() {
        fetching = true
        offset += limit
    }
}
