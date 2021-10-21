//
//  AuthManagerProtocol.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 21.10.2021.
//

import Foundation

import Foundation

typealias BooleanBlock = (Bool) -> Void

protocol AuthenticationManagerProtocol {
    
    func isLoggedIn(with completion: @escaping BooleanBlock)
    
}
