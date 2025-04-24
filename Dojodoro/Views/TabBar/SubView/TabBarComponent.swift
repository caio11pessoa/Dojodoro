//
//  DojodoroTabBar.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 07/04/25.
//

import SwiftUI

struct TabBarComponent: View {
    @Binding var selectedTab: Int

    init(target: Binding<Int>) {
        self._selectedTab = target
    }

    var body: some View {
        HStack(spacing: 0) {
            ForEach(TabBarItem.allCases, id: \.rawValue) { item in
                Button {
                    selectedTab = item.rawValue
                } label: {
                    CustomTabItem(
                        imageName: item.iconName,
                        title: item.title,
                        isActive: selectedTab == item.rawValue
                    )
                }
                if item != TabBarItem.allCases.last {
                    Spacer()
                }
            }
        }
    }

    private func CustomTabItem(
        imageName: [String: String],
        title: String,
        isActive: Bool
    ) -> some View {
        VStack {
            Image(isActive ? imageName["Selected"] ?? "" : imageName["Unselected"] ?? "")
                .resizable()
                .frame(width: 34, height: 34)
            Text(title)
                .font(Font.dojoUI(.tabBar))
                .foregroundColor(isActive ? Color.backgroundBox : Color.tabBarGray)
        }
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    @Previewable @State var target: Int = 0
    VStack {
        Spacer()
        TabBarComponent(target: $target)
            .frame(height: 90)
    }
    .ignoresSafeArea()
    .padding(.horizontal, 48)
}
