//
//  CS4540BookApp.swift
//  CS4540Book
//
//  Created by Jean Paul Espinosa on 6/10/22.
//

import SwiftUI

@main
struct CS4540BookApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
