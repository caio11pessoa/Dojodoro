//
//  Navigation.swift
//  Dojodoro
//
//  Created by Daniel Araujo Nobre on 24/02/25.
//

import Foundation

enum AppScreen: Hashable {
    case dojodoro
}

enum TabBarItem: Int, CaseIterable {
    case loja = 0
    case bonsai = 1
    case jardim = 2
    
    var title: String {
        switch self {
        case .loja:
            return "Loja"
        case .jardim:
            return "Jardim"
        case .bonsai:
            return "Bonsai"
        }
    }
    
    var iconName: [String: String]{
        switch self {
        case .loja:
            return ["Selected": "MarketMarkSelected", "Unselected": "MarketMarkUnselected"]
        case .jardim:
            return ["Selected": "GardenMarkSelected", "Unselected": "GardenMarkUnselected"]
        case .bonsai:
            return ["Selected": "BonsaiMarkSelected", "Unselected": "BonsaiMarkUnselected"]
        }
    }
}
