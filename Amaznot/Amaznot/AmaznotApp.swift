//
//  AmaznotApp.swift
//  Amaznot
//
//  Created by Andrea Copellino on 16/11/22.
//

import SwiftUI

@main
struct AmaznotApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(DataStore())
        }
    }
}

struct CustomColor {
    static let sfondoDinamico = Color("sfondoDinamico")
}
