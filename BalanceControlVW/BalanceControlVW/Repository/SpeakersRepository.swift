//
//  SpeakersRepository.swift
//  BalanceControlVW
//
//  Created by Winkelmuller on 13/10/2023.
//

import Foundation


class SpeakersRepository : ObservableObject{
    
    static let shared = SpeakersRepository()
    
    @Published var speakers = [
        Speaker(name: "Left speaker", mute: false, bass: 0, mid: 0, treble: 0),
        Speaker(name: "Right speaker", mute: false, bass: 0, mid: 0, treble: 0)
    ]
}
