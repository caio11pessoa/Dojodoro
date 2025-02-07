//
//  PomodoroSingleton.swift
//  pomodoroPOC
//
//  Created by Caio de Almeida Pessoa on 13/01/25.
//

import Foundation

class PomodoroSingleton {
    
    private var timer: Timer?
    private var timeUnitSelected: Int = TimeUnit.decisecond.rawValue
    var isRunning: Bool = false
    private var initialClockCentiSeconds: Int?
    private var initialRestTimeCentiSeconds: Int?
    private var clockCentiSeconds: Int?
    private var TrackClock: ((Int, Int, Bool, Bool) -> Void)? // Dá pra colocar em uma interface
    var recover: Bool = false
    
    private init() {}
    static let shared = PomodoroSingleton()
    
    
    func initialConfig(_ pomodoro: Pomodoro, updateClock: ((Int, Int, Bool, Bool) -> Void)? = nil) { // Ajeitar a lógica de receber em segundos
        
        clockCentiSeconds = pomodoro.workTime * timeUnitSelected
        self.initialClockCentiSeconds = pomodoro.workTime * timeUnitSelected
        self.initialRestTimeCentiSeconds = pomodoro.restTime * timeUnitSelected
        self.TrackClock = updateClock
        
    }
    
    func play() {
        guard !isRunning else { return }
        recover = false
        isRunning = true
        
        timer = Timer.scheduledTimer(withTimeInterval: CGFloat(1/timeUnitSelected.toDouble()), repeats: true) { [weak self] _ in
            
            guard let self = self else { return }
            guard  self.clockCentiSeconds != nil else { return }
            
            let isClockOver = self.clockCentiSeconds == 0
            
            if isClockOver {
                recover = true
                pauseClock()
                resetClock()
                playRecover()
                return
            }
            
            self.clockCentiSeconds! -= 1
            
            if let TrackClock = self.TrackClock {
                
                let clockSeconds = self.clockCentiSeconds!.toDouble()/timeUnitSelected.toDouble()
                let clockSecondsCeil = Int(ceil(clockSeconds))
                
                TrackClock(clockSecondsCeil, self.clockCentiSeconds!, recover, isRunning)
            }
        }
    }
    
    func playRecover() {
        guard !isRunning else { return }
        recover = true
        
        
        isRunning = true
        
        timer = Timer.scheduledTimer(withTimeInterval: CGFloat(1/timeUnitSelected.toDouble()), repeats: true) { [weak self] _ in
            
            guard let self = self else { return }
            guard  self.clockCentiSeconds != nil else { return }
            
            let isClockOver = self.clockCentiSeconds == 0
            
            if isClockOver {
                recover = false
                pauseClock()
                resetClock()
                if let TrackClock = self.TrackClock {
                    
                    let clockSeconds = self.clockCentiSeconds!.toDouble()/timeUnitSelected.toDouble()
                    let clockSecondsCeil = Int(ceil(clockSeconds))
                    
                    TrackClock(clockSecondsCeil, self.clockCentiSeconds!, recover, isRunning)
                }
                return
            }
            
            self.clockCentiSeconds! -= 1
            
            if let TrackClock = self.TrackClock {
                
                let clockSeconds = self.clockCentiSeconds!.toDouble()/timeUnitSelected.toDouble()
                let clockSecondsCeil = Int(ceil(clockSeconds))
                
                TrackClock(clockSecondsCeil, self.clockCentiSeconds!, recover, isRunning)
            }
        }
    }
    
    func pauseClock() {
        guard isRunning else { return }
        isRunning = false
        
        timer?.invalidate()
        timer = nil
    }
    
    func updateClock(pomodoro: Pomodoro){
        initialClockCentiSeconds = pomodoro.workTime * timeUnitSelected
        initialRestTimeCentiSeconds = pomodoro.restTime * timeUnitSelected
        resetClock()
    }
    
    func resetClock() {
        if recover {
            clockCentiSeconds = initialRestTimeCentiSeconds
        }else {
            clockCentiSeconds = initialClockCentiSeconds
        }
    }
}
