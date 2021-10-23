//
//  CredentialsProvider.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 23.10.2021.
//

import Foundation

class CredentialsProvider: CredentialsProviderProtocol {
    
    static let shared = CredentialsProvider()
    
    private init() { }
    
    func getApiKey() -> String {
        return "c609c319-8d02-4dd9-8d58-8581f4911c37"
    }
}
