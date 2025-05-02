//
//  PomodoroSingleton.swift
//  pomodoroPOC
//
//  Created by Caio de Almeida Pessoa on 13/01/25.
//

import Foundation


class PomodoroSingleton {
    
    var tempoTotal: Int = 0
    var tempoAtual: Int = 0
    var configurado: Bool = false
    var novoTimer: Timer?
    
    func novaConfiguration(tempo: Int) {
        tempoTotal = tempo
        tempoAtual = tempo
        configurado = true
    }
    
    func resetarConfig() {
        tempoAtual = tempoTotal
    }
    
    func comecarClock(_ a: Int, iterador: @escaping (Int, Bool) -> Void) {
        tempoAtual = a
        if novoTimer == nil && configurado {
            novoTimer = Timer.scheduledTimer(withTimeInterval: CGFloat(1), repeats: true, block: { t in
                self.tempoAtual -= 1
                print("tempoAtual: \(self.tempoAtual)")
                if self.tempoAtual <= 0 {
                    print("fim")
                    self.pararClock()
                    iterador(self.tempoAtual, true)
                    return
                }
            })
        }
        
    }
    
    func pararClock() {
        novoTimer?.invalidate()
        novoTimer = nil
    }
    
    
    
    
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
    

    
    // TODO: Change Pomodoro parameter
    func initialConfig(_ pomodoro: Pomodoro, updateClock: ((Int, Int, Bool, Bool) -> Void)? = nil) { // Ajeitar a lógica de receber em segundos
        
        clockCentiSeconds = pomodoro.workTime.rawValue * timeUnitSelected
        initialClockCentiSeconds = pomodoro.workTime.rawValue * timeUnitSelected
        initialRestTimeCentiSeconds = pomodoro.restTime.rawValue * timeUnitSelected
        TrackClock = updateClock
        
    }
    
    func play() {
        guard !isRunning else { return }
        recover = false
        isRunning = true
        
        timer = Timer.scheduledTimer(withTimeInterval: CGFloat(1/timeUnitSelected.toDouble()), repeats: true) { _ in
            
//            guard let self = self else { return }
            guard  self.clockCentiSeconds != nil else { return }
            
            let isClockOver = self.clockCentiSeconds! <= 0
            
            if isClockOver {
                self.recover = true
                self.pauseClock()
                self.resetClock()
                self.playRecover()
                return
            }
            
            self.clockCentiSeconds! -= 1
            
            if let TrackClock = self.TrackClock {
                
                let clockSeconds = self.clockCentiSeconds!.toDouble()/self.timeUnitSelected.toDouble()
                let clockSecondsCeil = Int(ceil(clockSeconds))
                
                TrackClock(clockSecondsCeil, self.clockCentiSeconds!, self.recover, self.isRunning)
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
    
    func updateClock(workTime: Int, restTime: Int){
        initialClockCentiSeconds = workTime * timeUnitSelected
        initialRestTimeCentiSeconds = restTime * timeUnitSelected
        print("Singleton Work: \(initialClockCentiSeconds!)")
        print("Singleton Rest: \(initialRestTimeCentiSeconds!)")
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
