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
        Speaker(name: "Left speaker", mute: false, bass: 0.0, mid: 0.0, treble: 0.0),
        Speaker(name: "Right speaker", mute: false, bass: 0.0, mid: 0.0, treble: 0.0)
    ]
    
    @Published var volume : Double = 0
    @Published var balance : Double = 0
    
    func balanceChange(name:String){
        if(speakers[0].mute == false && name == "Right speaker" || speakers[1].mute == false && name == "Left speaker"){
            balance = 0
        }
        else if(name == "Right speaker"){
            balance = -4
        }
        else if(name == "Left speaker"){
            balance = 4
        }
    }
    
    func checkBalance(name:String){
        if(speakers[0].mute == true && name == "Right speaker" || speakers[1].mute == true && name == "Left speaker"){
            balance = 0
        }else if(name == "Right speaker"){
            balance = 4
        }else if(name == "Left speaker"){
            balance = -4
        }
        
    }
    
    
}
