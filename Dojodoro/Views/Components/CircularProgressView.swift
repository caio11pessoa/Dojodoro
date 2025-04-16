//
//  CircularProgressView.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 15/04/25.
//

import SwiftUI

struct CircularProgressView: View {
    private let isWorking: Bool
    private var percentagem: Double = 0.25
    private var maxAngle: Double = 360
    private var progress: Double { percentagem*(maxAngle/maxAngle)
    }
    private var lineWidth: CGFloat = 6
    
    
    init(percentagem: Double, isWorking: Bool = true) {
        self.isWorking = isWorking
        self.percentagem = percentagem
    }
    private var circleProgress: some View {
        ZStack{
            Circle()
                .stroke(
                    Color(isWorking ? "CircleUnprogress": "CircleUnprogressRest"),
                    lineWidth: lineWidth
                )
                .padding()
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color(isWorking ? "CircleProgress" : "CircleProgressRest"),
                    style: StrokeStyle(
                        lineWidth: lineWidth,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .padding()
            HStack{
                Spacer()
                Circle()
                    .frame(width: 15)
                    .overlay {
                        Circle()
                            .foregroundStyle(isWorking ? Color("Background") : Color("BackgroundRest"))
                            .frame(width: 7)
                    }
                    .padding(8)
                    .foregroundStyle(Color(isWorking ? "CircleProgress" : "CircleProgressRest"))
            }
            .rotationEffect(.degrees(-90 + percentagem*maxAngle))
        }
    }
    var body: some View {
        circleProgress
    }
}

#Preview {
    CircularProgressView(percentagem: 0.5)
        .padding(.horizontal, 100)
}
