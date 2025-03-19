//
//  ContentView.swift
//  WindowsProject
//
//  Created by Vincent Joy on 19/03/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct StartingView: View {
    
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        VStack(spacing: 30) {
            // Image
            Image(systemName: "visionpro")
                .font(.system(size: 150))
                .symbolEffect(.pulse)
                .bold()
            
            // Buttons
            HStack {
                Button("Window 1") {
                    openWindow(id: WindowID.window1)
                }
                Button("Window 2") {
                    openWindow(id: WindowID.window2)
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    StartingView()
}
