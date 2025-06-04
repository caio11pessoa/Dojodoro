//
//  PomodoroSingleton.swift
//  pomodoroPOC
//
//  Created by Caio de Almeida Pessoa on 13/01/25.
//

import Foundation


class PomodoroSingleton {
    
    private init() {}
    static let shared = PomodoroSingleton()
    
    var totalTime: Double = 0
    var currentTime: Double = 0
    var configured: Bool = true
    var timer: Timer?
    var isRunning: Bool = true
    
    /// Initial configuration
    func configure(with time: Double) {
        totalTime = time
        currentTime = time
        configured = true
        isRunning = true
    }
    
    /// Reset to the currentTime to the totalTime registered
    func resetConfig(with time: Double) {
        totalTime = time
        currentTime = time
        configured = true
    }
    
    /// start countdown clockstar
    func startClock(tick: @escaping (Double, Bool) -> Void) {
        timer = Timer.scheduledTimer(withTimeInterval: CGFloat(0.1), repeats: true, block: { [weak self] _ in
            
            guard let self = self else { return }
            
            if isRunning {
                let timeFinished: Bool = currentTime <= 0.1
                currentTime = timeFinished ? 0 : currentTime - 0.1
                isRunning = timeFinished ? false : true
                tick(currentTime, isRunning)

            }
        })
    }
    func pause() {
        isRunning = false
    }
    func resume() {
        isRunning = true
    }
    
    /// invalidateTimer and isRunning = false
    func stop() {
        isRunning = false
        invalidateTimer()
        
    }
    
    /// Invalidates and clears the timer
    private func invalidateTimer() {
        timer?.invalidate()
        timer = nil
        print(timer ?? "nil")
    }
    
    
}
