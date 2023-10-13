//
//  SpeakerView.swift
//  BalanceControlVW
//
//  Created by Winkelmuller on 13/10/2023.
//

import SwiftUI

struct SpeakerView: View {
    
    @Binding var speaker : Speaker
    @State var speakerOn : Bool
    
    var body: some View {
        VStack(spacing:16){
            Image("speakerImg")
                .resizable()
                .scaledToFit()
            
            Toggle(isOn: $speakerOn, label: {
                VStack{
                    Text("\(speaker.name)")
                        .font(.system(size: 20, weight: .bold, design: .default))
                    Text("mute or unmute")
                }
            })
                
       
            Button{
                
            } label: {
                Text("Mix")
                    .frame(maxWidth: .infinity)
            }
                .buttonStyle(.borderedProminent)
                
        }.padding(16)
        
    }
}

struct SpeakerView_Previews: PreviewProvider {
    static var previews: some View {
        let speaktest = Speaker (name:"Test speaker",mute:false,bass:0,mid:0,treble:0)
        SpeakerView(speaker: .constant(speaktest), speakerOn: true)
    }
}
