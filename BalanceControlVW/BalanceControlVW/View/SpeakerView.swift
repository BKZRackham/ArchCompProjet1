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
            
            //Utilisation d'un binding sur la valeur booléenne du Toggle pour lancer la bonne fonction depuis le Repository qui agit comme une classe statique dans cette vue
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
                
                //Affichage du Toggle lié à la valeur de mute dans le speaker
                Toggle(isOn: binding, label: {
                    VStack{
                        Text("\(speaker.name)")
                            .font(.system(size: 20, weight: .bold, design: .default))
                        Text("mute or unmute")
                    }
                })
                
                // Lien de navigation sous forme d'un bouton qui affichera les détails du speaker
                
                NavigationLink(destination:MixView(speakerOn: $speakerOn,speaker: $speaker),isActive: $showMix){
                    Button{showMix = true} label: {
                        Text("Mix")
                            .frame(maxWidth: .infinity)
                    }
                    .padding(16)
                    .buttonStyle(.borderedProminent)
                }
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
