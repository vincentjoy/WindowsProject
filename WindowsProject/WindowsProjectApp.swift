//
//  WindowsProjectApp.swift
//  WindowsProject
//
//  Created by Vincent Joy on 19/03/25.
//

import SwiftUI

@main
struct WindowsProjectApp: App {
    var body: some Scene {
        WindowGroup {
            StartingWindow()
        }
        .defaultSize(width: 600, height: 450)
    }
}
