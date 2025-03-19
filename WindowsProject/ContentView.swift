//
//  ContentView.swift
//  WindowsProject
//
//  Created by Vincent Joy on 19/03/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct StartingWindow: View {
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
                    // Action
                }
                Button("Window 2") {
                    // Action
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    StartingWindow()
}
