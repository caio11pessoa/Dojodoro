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
    var configured: Bool = false
    var timer: Timer?
    var isRunning: Bool = true
    
    /// Initial configuration
    func configure(with time: Double) {
        totalTime = time
        currentTime = time
        configured = true
    }
    
    /// Reset to the currentTime to the totalTime registered
    func resetConfig() {
        currentTime = totalTime
    }
    
    /// Reset the configuration to the new Time
    func reconfigure(with time: Double){
        configure(with: time)
    }
    
    /// start countdown clockstar
    func startClock(from time: Double, tick: @escaping (Double, Bool) -> Void) {
        currentTime = time
        if timer == nil && configured {
            timer = Timer.scheduledTimer(withTimeInterval: CGFloat(0.1), repeats: true, block: { [weak self] _ in
                
                guard let self = self else { return }
                
                guard self.isRunning else {
                    self.invalidateTimer()
                    return
                }
                
                if self.currentTime <= 0.1 {
                    self.currentTime = 0
                    tick(self.currentTime, true)
                    self.stop()
                    return
                }else {
                    tick(self.currentTime, false)
                    self.currentTime -= 0.1
                }
                
            })
        }
    }
    func pause() {
        isRunning = false
    }
    
    func resume() {
        isRunning = true
    }
    
    func stop() {
        isRunning = false
        invalidateTimer()
        
    }
    
    /// Invalidates and clears the timer
    private func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    
}
