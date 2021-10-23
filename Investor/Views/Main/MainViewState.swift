//
//  MainViewState.swift
//  Investor
//
//  Created by Erinç Olkan Dokumacıoğlu on 22.10.2021.
//

import Foundation

typealias MainViewStateBlock = (MainViewState) -> Void

enum MainViewState {
    case loading
    case error
    case done
}
