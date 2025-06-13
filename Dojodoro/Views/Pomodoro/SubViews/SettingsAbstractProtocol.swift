//
//  SettingsAbstractProtocol.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 24/04/25.
//


import SwiftUI

protocol SettingsAbstract {}

extension SettingsAbstract {
    func titleSettings(text title: String, underTitle: String) -> some View {
        ZStack {
            Text(underTitle)
                .font(.dojoUI(.displayExtraLargeDotGothic))
                .foregroundStyle(Color.textColorPrimary)
                .opacity(0.5)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
            Text(title)
                .font(.dojoUI(.titleLarge))
                .foregroundStyle(Color.background)
        }
    }
    
    func labelSettings(icon: ImageName, text: String) -> some View {
        HStack {
            Image(icon.rawValue)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 24)
                .foregroundStyle(Color.background)
            Text(text)
                .foregroundStyle(Color.background)
                .agdasimaRegularFont(size: 32)
        }
    }
    
    func backButton(viewModelSettings: SettingsViewModel) -> some View {
        Button {
            viewModelSettings.goBack()
        } label: {
            Image( .leftChevron)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 38)
                .foregroundStyle(Color.background)
            Text("Voltar")
                .agdasimaRegularFont(size: 32)
                .foregroundStyle(Color.background)
        }
    }
}
