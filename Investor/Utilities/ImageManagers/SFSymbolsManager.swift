//
//  SFSymbolsManager.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 23.10.2021.
//

import Foundation
import UIKit
import BaseComponents

enum SFSymbolsManager: String, GenericValueProtocol {

    typealias Value = UIImage?
    
    var value: UIImage? {
        return UIImage(systemName: rawValue)
    }
    
    case personOutlined = "person.circle"
    case personFilled = "person.circle.fill"
    case gearshape = "gearshape"
    case questionmark = "questionmark.circle"
    
}
