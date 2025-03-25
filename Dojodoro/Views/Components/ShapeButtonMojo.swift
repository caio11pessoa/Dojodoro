//
//  ShapeButtonMojo.swift
//  Dojodoro
//
//  Created by Daniel Nobre on 21/03/25.
//

import SwiftUI

struct ShapeButtonMojo: View {
    var body: some View {
        MojoBotaoShape()
            .foregroundStyle(.backgroundButtonSelected)
            .frame(width: 295, height: 48)
            .overlay(
                MojoBotaoShape()
                    .stroke(style: StrokeStyle(lineWidth: 2))
                    .foregroundStyle(.borderButtonSelected)
            )
    }
}

struct MojoBotaoShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        // 1
        path.addLine(to: CGPoint(x: rect.maxX * 0.985, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX * 0.985, y: rect.maxY * 0.9))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 0.9))
        // 2
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 0.1))
        path.addLine(to: CGPoint(x: rect.maxX * 0.985, y: rect.maxY * 0.1))
        path.addLine(to: CGPoint(x: rect.maxX * 0.985, y: rect.minY))
        // 3
        path.addLine(to: CGPoint(x: rect.maxX * 0.015, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX * 0.015, y: rect.maxY * 0.1))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * 0.1))
        // 4
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * 0.9))
        path.addLine(to: CGPoint(x: rect.maxX * 0.015, y: rect.maxY * 0.9))
        path.addLine(to: CGPoint(x: rect.maxX * 0.015, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        return path
    }
}

#Preview {
    ShapeButtonMojo()
}
