//
//  EndpointHelper.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 22.10.2021.
//

import Foundation

typealias BaseUrl = EndpointHelper.BaseUrls
typealias Paths = EndpointHelper.Paths

enum EndpointHelper {

    enum BaseUrls: CustomStringConvertible {
        case dev
        
        var description: String {
            switch self {
            case .dev:
                return "https://pro-api.coinmarketcap.com/v1/"
            }
        }
    }
    
    enum Paths: CustomStringConvertible {
        case latestCoinData
        
        var description: String {
            switch self {
            case .latestCoinData:
                return "cryptocurrency/listings/latest"

            }
        }
    }
    
}
