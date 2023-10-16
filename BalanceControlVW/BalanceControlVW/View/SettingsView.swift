//
//  SettingsView.swift
//  BalanceControlVW
//
//  Created by Winkelmuller on 13/10/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var repository = SpeakersRepository.shared
    @State var speakerOn : Bool = true
    
    
    var body: some View {
        NavigationStack{
            VStack{
                
                // Sliders pour affichage du Volume et de la Balance
                HStack{
                    Text("Volume").frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(Int(repository.volume))").frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(16)
                Slider(value:$repository.volume, in:0...40)
                    .padding(.horizontal,16)
                    .padding(.bottom,32)
                
                
                HStack{
                    Text("Balance").frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(Int(repository.balance))").frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(16)
                // Le Slider de la Balance avec une fonction permettant d'agir sur les valeurs de mute des speakers. Ce changement est répercuté sur les Toggle dans la SpeakerView
                Slider(value:$repository.balance, in:-4...4, step: 1){
                    editing in if(Int(repository.balance) == -4){
                        repository.speakers[0].mute = true
                        repository.speakers[1].mute = false
                    } else if(Int(repository.balance) == 4) {
                        repository.speakers[1].mute = true
                        repository.speakers[0].mute = false
                    }else{
                        repository.speakers[1].mute = true
                        repository.speakers[0].mute = true
                    }
                }
                .padding(.horizontal,16)
                .padding(.bottom,32)
                
                
                //Affichage des Speakers en ajoutant des SpeakerView une pour chaque speaker dans le repository
                HStack{
                    ForEach($repository.speakers, id: \.self) { $speaker in
                        SpeakerView(speaker: $speaker, speakerOn: $speaker.mute)
                    }
                }
            }.navigationTitle("Settings")
        }
        
        
    }
}
    

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let test = true
        SettingsView(speakerOn: test)
    }
}
