//
//  PinBIApp.swift
//  PinBI
//
//  Created by Syuhada Rantisi on 05/08/24.
//

import SwiftUI
import SwiftData

@main
struct PinBIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Document.self, MistakeList.self])
    }
}
