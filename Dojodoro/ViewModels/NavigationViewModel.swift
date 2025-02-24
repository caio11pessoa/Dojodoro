//
//  NavigationViewModel.swift
//  Dojodoro
//
//  Created by Daniel Araujo Nobre on 24/02/25.
//

import Foundation

@Observable
class AppRouter {
    var path: [AppScreen] = []
    
    func navigate(to screen: AppScreen) {
        path.append(screen)
    }
    
    func goBack() {
        path.removeLast()
    }
}
