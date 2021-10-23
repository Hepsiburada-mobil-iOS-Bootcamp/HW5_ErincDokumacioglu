//
//  CoinbaseApiServiceProvider.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 22.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage


class CoinbaseApiServiceProvider: ApiServiceProvider<BaseRequest> {
    
    init(request: BaseRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.dev.description,
                   path: Paths.latestCoinData.description,
                   data: request)
    }
}
