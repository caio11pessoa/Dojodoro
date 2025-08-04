//
//  SongViewModel.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 25/06/25.
//

import Foundation
import AVFoundation

@Observable
class SongViewModel {
    var audioPlayer: AVAudioPlayer?
    var volume: Float = 5
    init(audioPlayer: AVAudioPlayer? = nil) {
        self.audioPlayer = audioPlayer
    }
    
    func playBackgroundMusic(named fileName: String, withExtension ext: String = "mp3") {
        if fileName == "none" {return}

        guard let url = Bundle.main.url(forResource: fileName, withExtension: ext) else {
            print("Erro: Música não encontrada.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1 // loop infinito
            audioPlayer?.volume = volume
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Erro ao tocar música: \(error.localizedDescription)")
        }
    }
    
    
    func stopBackgroundMusic() {
        audioPlayer?.stop()
    }
    
    func abaixarVolume() {
        volume = 1
        audioPlayer?.volume = volume
    }
    
    func aumentarVolume() {
        volume = 5
        audioPlayer?.volume = volume
    }
}
