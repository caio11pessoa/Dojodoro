import SwiftUI

struct ProgressPomodoro: View {
    var progress: Int
    var recover: Bool = false
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<images.count, id: \.self) { i in
                ProgressCell(
                    opacity: i <= progress ? 1.0 : 0.5,
                    imageName: images[i],
                    animated: i == progress, 
                    recover: recover
                )
            }
        }
    }
    
    private let images: [String] = [
        "clock", "rest", "clock", "rest",
        "clock", "rest", "clock", "BigRest"
    ]
}

#Preview {
    ProgressPomodoro(progress: 4, recover: false)
}
