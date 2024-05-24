//
//  SduiSwiftApp.swift
//  SduiSwift
//
//  Created by 大村勇人 on 2024/05/24.
//

import SwiftUI

@main
struct SduiSwiftApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
