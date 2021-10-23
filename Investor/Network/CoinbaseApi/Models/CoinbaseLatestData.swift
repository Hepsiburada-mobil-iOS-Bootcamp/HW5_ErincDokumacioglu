//
//  CoinbaseLatestData.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 22.10.2021.
//

import Foundation

// MARK: - CoinbaseLatestData
struct CoinbaseLatestData: Codable {
    let data: [Datum]?
    let status: Status?
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int?
    let name, symbol, slug: String?
    let cmcRank, numMarketPairs, circulatingSupply, totalSupply: Int?
    let maxSupply: Int?
    let lastUpdated, dateAdded: String?
    let tags: [String]?
    let platform: JSONNull?
    let quote: [String: Quote]?

    enum CodingKeys: String, CodingKey {
        case id, name, symbol, slug
        case cmcRank
        case numMarketPairs
        case circulatingSupply
        case totalSupply
        case maxSupply
        case lastUpdated
        case dateAdded
        case tags, platform, quote
    }
}

// MARK: - Quote
struct Quote: Codable {
    let price: Double?
    let volume24H: Int?
    let volumeChange24H, percentChange1H, percentChange24H, percentChange7D: Double?
    let marketCap: Double?
    let marketCapDominance: Int?
    let fullyDilutedMarketCap: Double?
    let lastUpdated: String?

    enum CodingKeys: String, CodingKey {
        case price
        case volume24H
        case volumeChange24H
        case percentChange1H
        case percentChange24H
        case percentChange7D
        case marketCap
        case marketCapDominance
        case fullyDilutedMarketCap
        case lastUpdated
    }
}

// MARK: - Status
struct Status: Codable {
    let timestamp: String?
    let errorCode: Int?
    let errorMessage: String?
    let elapsed, creditCount: Int?

    enum CodingKeys: String, CodingKey {
        case timestamp
        case errorCode
        case errorMessage
        case elapsed
        case creditCount
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

