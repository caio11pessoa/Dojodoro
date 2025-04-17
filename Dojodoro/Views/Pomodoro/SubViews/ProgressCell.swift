//
//  ProgressCell.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 17/04/25.
//


import SwiftUI

struct ProgressCell: View {
    var opacity: Double = 1.0
    var imageName: String
    var animated: Bool = false
    var recover: Bool = false
    
    @State private var isVisible: Bool = true
    
    var body: some View {
        Image(imageName)
            .renderingMode(.template)
            .opacity(animated ? (isVisible ? opacity : 1) : opacity)
            .foregroundStyle(recover ? .progressIconRest: .progressIconFocus)
            .onAppear {
                if animated {
                    withAnimation(
                        Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true)
                    ) {
                        isVisible.toggle()
                    }
                }
            }
    }
}

#Preview {
    ProgressCell(opacity: 0.5, imageName: "BigRest", animated: true, recover: false)
}
