//
//  SpeakerView.swift
//  BalanceControlVW
//
//  Created by Winkelmuller on 13/10/2023.
//

import SwiftUI

struct SpeakerView: View {
    
    @Binding var speaker : Speaker
    @Binding  var speakerOn : Bool
    @StateObject var repository = SpeakersRepository.shared
    @State private var showMix = false
    
    var body: some View {
        NavigationStack{
            let binding = Binding<Bool> {
                speakerOn
            } set: { _ in
                if (speakerOn == true){
                    repository.balanceChange(name: speaker.name)
                    speakerOn = false
                } else {
                    repository.checkBalance(name: speaker.name)
                    speakerOn = true
                    
                }
                
            }
            
            VStack(spacing:16){
                Image("speakerImg")
                    .resizable()
                    .scaledToFit()
                
                Toggle(isOn: binding, label: {
                    VStack{
                        Text("\(speaker.name)")
                            .font(.system(size: 20, weight: .bold, design: .default))
                        Text("mute or unmute")
                    }
                })
                
                
                NavigationLink(destination:MixView(speakerOn: $speakerOn,speaker: $repository.speakers[0]),isActive: $showMix){
                    Button{showMix = true} label: {
                        Text("Mix")
                            .frame(maxWidth: .infinity)
                    }
                    .padding(16)
                    .buttonStyle(.borderedProminent)
                }.navigationTitle("\(speaker.name)")
            }
            
        }
    
        
        
        
}
    
    struct SpeakerView_Previews: PreviewProvider {
        static var previews: some View {
            let speaktest = Speaker (name:"Test speaker",mute:false,bass:0,mid:0,treble:0)
            SpeakerView(speaker: .constant(speaktest), speakerOn: .constant(true))
        }
    }
}
