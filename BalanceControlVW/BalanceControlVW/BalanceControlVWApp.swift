//
//  BalanceControlVWApp.swift
//  BalanceControlVW
//
//  Created by Winkelmuller on 13/10/2023.
//

import SwiftUI

@main
struct BalanceControlVWApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                SettingsView()
            }.navigationTitle("Settings")
            
        }
    }
}
