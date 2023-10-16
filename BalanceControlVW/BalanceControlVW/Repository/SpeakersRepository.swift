//
//  SpeakersRepository.swift
//  BalanceControlVW
//
//  Created by Winkelmuller on 13/10/2023.
//

import Foundation


class SpeakersRepository : ObservableObject{
    
    static let shared = SpeakersRepository(volume: 0.0, balance: 0.0)
    
    
    //Représentation de la vérité des valeurs contenues dans l'application, les deux speakers, plus les valeurs de volume et de balance
    @Published var speakers = [
        Speaker(name: "Left speaker", mute: true, bass: 0.0, mid: 0.0, treble: 0.0),
        Speaker(name: "Right speaker", mute: true, bass: 0.0, mid: 0.0, treble: 0.0)
    ]
    
    //Utilisation d'UserDefaults pour la persistance des données même après destruction de l'application
    @Published var volume: Double {
        didSet {
            UserDefaults.standard.set(volume, forKey: "volume")
        }
    }
    
    @Published var balance: Double {
        didSet {
            UserDefaults.standard.set(balance, forKey: "balance")
        }
    }
    
    init(speakers: [Speaker] = [
        Speaker(name: "Left speaker", mute: true, bass: 0.0, mid: 0.0, treble: 0.0),
        Speaker(name: "Right speaker", mute: true, bass: 0.0, mid: 0.0, treble: 0.0)
    ], volume: Double, balance: Double) {
        self.speakers = speakers
        self.volume = UserDefaults.standard.object(forKey: "volume") as? Double ?? 0.0
        self.balance = UserDefaults.standard.object(forKey: "balance") as? Double ?? 0.0
    }
    
    
    
    //Les deux fonctions utilisées pour changer les valeurs des Toggle dans les SpeakerView. Une pour l'activation et la désactivation du Toggle
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
