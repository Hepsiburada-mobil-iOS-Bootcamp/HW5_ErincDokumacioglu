//
//  AccountViewDataFormatter.swift
//  WeatherApplication
//
//  Created by Erkut Bas on 17.10.2021.
//

import UIKit

class AccountViewDataFormatter: AccountViewDataProtocol {
    
    func getAccountViewComponentData(by loggedIn: Bool) -> [GenericDataProtocol] {
        
        var rows = [ItemTableViewCellData]()
        
        let settings = LabelPackComponentData(title: "Settings")
            .setTitleLabelDistributionData(by: LabelDistributionData()
                                            .setFont(by: FontManager.regular(12).value)
                                            .setTextAlignment(by: .left)
                                            .setContentMode(by: .center)
                                            .setNumberOfLines(by: 1))
        
        rows.append(ItemTableViewCellData(cellInfo: settings, iconImage: SFSymbolsManager.gearshape.value!, cellAction: .settings))
        
        let help = LabelPackComponentData(title: "Help")
            .setTitleLabelDistributionData(by: LabelDistributionData()
                                            .setFont(by: FontManager.regular(12).value)
                                            .setTextAlignment(by: .left)
                                            .setContentMode(by: .center)
                                            .setNumberOfLines(by: 1))
        
        rows.append(ItemTableViewCellData(cellInfo: help, iconImage: SFSymbolsManager.questionmark.value!, cellAction: .help))
        
        if loggedIn {
            let logout = LabelPackComponentData(title: "Logout")
                .setTitleLabelDistributionData(by: LabelDistributionData()
                                                .setFont(by: FontManager.regular(12).value)
                                                .setTextAlignment(by: .left)
                                                .setContentMode(by: .center)
                                                .setNumberOfLines(by: 1))
            
            rows.append(ItemTableViewCellData(cellInfo: logout, iconImage: SFSymbolsManager.questionmark.value!, cellAction: .logout))
        }
        
        return rows
                                           
    }
    
    func getHeaderViewData(with completion: @escaping VoidCompletionBlock) -> HeaderViewData {
        
        return HeaderViewData(
            labelPackData: LabelPackComponentData(title: "Your Profile", subTitle: "Login to start to fetch latest cryptocurrency data."),
            actionButtonData: ActionButtonData(text: "Login", buttonType: .filled(.bright))
                .setActionButtonListener(by: completion))
    }
    
}
