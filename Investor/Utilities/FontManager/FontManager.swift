//
//  FontManager.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 21.10.2021.
//

import Foundation
import BaseComponents
import UIKit

enum FontManager: GenericValueProtocol {
    typealias Value = UIFont?
    
    var value: UIFont? {
        switch self {
        case .bold(let size):
            return UIFont(name: "Montserrat-Black", size: size)
        case .medium(let size):
            return UIFont(name: "Montserrat-Bold", size: size)
        case .light(let size):
            return UIFont(name: "Montserrat-Thin", size: size)
        case .regular(let size):
            return UIFont(name: "Montserrat-Regular", size: size)
        }
    }
    
    case bold(CGFloat)
    case medium(CGFloat)
    case light(CGFloat)
    case regular(CGFloat)
    
}
