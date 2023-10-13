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
                
                HStack{
                    ForEach($repository.speakers, id: \.self) { $speaker in
                        SpeakerView(speaker: $speaker, speakerOn: $speaker.mute)
                    }
                }
            }
        }
        
        
    }
}
    

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let test = true
        SettingsView(speakerOn: test)
    }
}
