//
//  ImagesManager.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 22.10.2021.
//

import Foundation
import BaseComponents
import UIKit

enum ImageManager: String, GenericValueProtocol {
    typealias Value = UIImage
    
    var value: UIImage {
        return UIImage(imageLiteralResourceName: rawValue)
    }
    
    case splashImage = "splashImage"

}
