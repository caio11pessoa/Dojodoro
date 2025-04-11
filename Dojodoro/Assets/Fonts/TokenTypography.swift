//
//  TokenTypography.swift
//  Dojodoro
//
//  Created by Daniel Araujo Nobre on 04/04/25.
//

import SwiftUI

struct TokenTypography {
    fileprivate enum FontSize: CGFloat {
        case caption = 12
        case body = 16
        case subheadline = 18
        case headline = 20
        case titleSmall = 24
        case titleMedium = 32
        case titleLargeDotGothic = 34
        case titleLarge = 48
        case titleLargeToolBarBackGround = 44
        case displayExtraLarge = 64
    }
}

enum TypographyCase {
    /// DotGothic16-Regular, 34px
    case titleLargeDotGothic
    /// DotGothic16-Regular, 32px
    case titleMediumDotGothic
    /// DotGothic16-Regular, 28px
    case displayLarge
    /// DotGothic16-Regular, 20px
    case headline
    /// DotGothic16-Regular, 18px
    case subheadline
    /// DotGothic16-Regular, 16px
    case body
    /// DotGothic16-Regular, 16px (com bold, se quiser destacar)
    case button

    /// Agdasima-Regular, 64px
    case tabBar
    /// Agdasima-Regular, 24returnpx
    case titleSmall
    /// Agdasima-Regular, 32px
    case titleMedium
    /// Agdasima-Regular, 48px
    case titleLarge
    /// Agdasima-Regular, 64px
    case displayExtraLarge

}


extension Font {
    static func dojoUI(_ typographyCase: TypographyCase) -> Font {
        switch typographyCase {

        // DotGothic16-Regular
        case .displayLarge:
            return Font.custom("DotGothic16-Regular", size:TokenTypography.FontSize.titleLargeDotGothic.rawValue)
        case .titleLargeDotGothic:
            return Font.custom("DotGothic16-Regular", size: TokenTypography.FontSize.titleLarge.rawValue)
        case .titleMediumDotGothic:
            return Font.custom("DotGothic16-Regular", size: TokenTypography.FontSize.titleLargeToolBarBackGround.rawValue)
        case .headline:
            return Font.custom("DotGothic16-Regular", size: TokenTypography.FontSize.headline.rawValue)
        case .subheadline:
            return Font.custom("DotGothic16-Regular", size: TokenTypography.FontSize.subheadline.rawValue)
        case .body:
            return Font.custom("DotGothic16-Regular", size: TokenTypography.FontSize.body.rawValue)
        case .button:
            return Font.custom("DotGothic16-Regular", size: TokenTypography.FontSize.body.rawValue)

        // Agdasima-Regular
        case .titleSmall:
            return Font.custom("Agdasima-Regular", size: TokenTypography.FontSize.titleSmall.rawValue)
        case .titleMedium:
            return Font.custom("Agdasima-Regular", size: TokenTypography.FontSize.titleMedium.rawValue)
        case .titleLarge:
            return Font.custom("Agdasima-Regular", size: TokenTypography.FontSize.titleLarge.rawValue)
        case .displayExtraLarge:
            return Font.custom("Agdasima-Regular", size: TokenTypography.FontSize.displayExtraLarge.rawValue)
        case .tabBar:
            return Font.custom("Agdasima-Regular", size: TokenTypography.FontSize.body.rawValue)
        }
    }
}

/// Uso: .font(Font.dojoUI(.buttonText))
