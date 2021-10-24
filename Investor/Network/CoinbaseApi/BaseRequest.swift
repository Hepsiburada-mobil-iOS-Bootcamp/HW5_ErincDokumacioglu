//
//  BaseRequest.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 22.10.2021.
//

import Foundation

struct BaseRequest: Codable {
    private(set) var apiKey: String
    private(set) public var offset: Int = 1
    private(set) public var limit: Int = 20
    
    public init(apiKey: String,
                offset: Int = 1,
                limit: Int = 20) {
        self.apiKey = apiKey
        self.offset = offset
        self.limit = limit
    }
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "CMC_PRO_API_KEY"
        case offset = "start"
        case limit = "limit"
    }
}
