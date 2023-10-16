//
//  MixView.swift
//  BalanceControlVW
//
//  Created by Winkelmuller on 13/10/2023.
//

import SwiftUI

struct MixView: View {
    
    @Binding  var speakerOn : Bool
    @Binding var speaker : Speaker
    
    //Cette vue va contenir les détails de toutes les valeurs de chaque speaker sous forme de Sliders
    
    var body: some View {
        NavigationStack{
            VStack{
                
                //On réaffiche le Toggle lié au Speaker
                Toggle(isOn: $speakerOn, label: {
                    VStack{
                        Text("Speaker on")
                            .font(.system(size: 20, weight: .bold, design: .default))
                        Text("mute or unmute")
                    }
                }).padding(25)
                
                
                //Affichage des 3 Sliders avec un titre associé à chacun.
                HStack{
                    Text("Bass").frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(Int(speaker.bass))").frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.horizontal,16)
                Slider(value:$speaker.bass, in:-15...15,step:1)
                    .padding(.horizontal,16)
                    .padding(.bottom,10)
                
                HStack{
                    Text("Mid").frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(Int(speaker.mid))").frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.horizontal,16)
                Slider(value:$speaker.mid, in:-15...15,step:1)
                    .padding(.horizontal,16)
                    .padding(.bottom,10)
                
                HStack{
                    Text("Treble").frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(Int(speaker.treble))").frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.horizontal,16)
                Slider(value:$speaker.treble, in:-15...15,step:1)
                    .padding(.horizontal,16)
                    .padding(.bottom,10)
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }.navigationTitle("\(speaker.name)")
        
    }
}

struct MixView_Previews: PreviewProvider {
    static var previews: some View {
        let speaktest = Speaker (name:"Test speaker",mute:false,bass:0,mid:0,treble:0)
        MixView(speakerOn: .constant(true),speaker: .constant(speaktest))
    }
}
