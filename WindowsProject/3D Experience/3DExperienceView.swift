//
//  3DExperienceView.swift
//  WindowsProject
//
//  Created by Vincent Joy on 20/03/25.
//

import SwiftUI
import _RealityKit_SwiftUI

struct ThreeDExperienceView: View {
    
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        ZStack {
            Image("Astronaut")
                .resizable()
                .scaledToFill()
            Button("Explore More") {
                openWindow(id: "Volume")
            }
            .controlSize(.extraLarge)
        }
    }
}

#Preview {
    ThreeDExperienceView()
}
