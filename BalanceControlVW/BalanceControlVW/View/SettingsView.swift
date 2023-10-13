//
//  SettingsView.swift
//  BalanceControlVW
//
//  Created by Winkelmuller on 13/10/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var repository = SpeakersRepository.shared
    
    
    var body: some View {
        VStack{
            
            
            HStack{
                ForEach($repository.speakers, id: \.self) { $speaker in
                    SpeakerView(speaker: $speaker, speakerOn: speaker.mute)
                }
            }
        }
            
        
        
    }
}
    

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
