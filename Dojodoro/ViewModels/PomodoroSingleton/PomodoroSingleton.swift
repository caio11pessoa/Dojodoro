//
//  PomodoroSingleton.swift
//  pomodoroPOC
//
//  Created by Caio de Almeida Pessoa on 13/01/25.
//

import Foundation


class PomodoroSingleton {
    
    var tempoTotal: Double = 0
    var tempoAtual: Double = 0
    var configurado: Bool = false
    var novoTimer: Timer?
    var isRunning: Bool = true
    
    func novaConfiguration(tempo: Double) {
        tempoTotal = tempo
        tempoAtual = tempo
        configurado = true
    }
    
    func resetarConfig() {
        tempoAtual = tempoTotal
    }
    
    func comecarClock(_ a: Double, iterador: @escaping (Double, Bool) -> Void) {
        tempoAtual = a
        if novoTimer == nil && configurado {
            novoTimer = Timer.scheduledTimer(withTimeInterval: CGFloat(0.1), repeats: true, block: { t in
                if self.isRunning {
                    if self.tempoAtual <= 0.1 {
                        print("fim")
                        self.pararClock()
                        iterador(self.tempoAtual, true)
                        return
                    }else {
                        iterador(self.tempoAtual, false)
                    }
                    self.tempoAtual -= 0.1
                }
                
            })
        }
    }
    
    func pararClock() {
        guard isRunning else { return }
        isRunning = false
//        novoTimer?.invalidate()
//        novoTimer = nil
    }
    
    func startarClick() {
        isRunning = true
    }
    
    private init() {}
    static let shared = PomodoroSingleton()
    
    

}
