//
//  3DExperienceView.swift
//  WindowsProject
//
//  Created by Vincent Joy on 20/03/25.
//

import SwiftUI
import _RealityKit_SwiftUI

struct ThreeDExperienceView: View {
    var body: some View {
        ZStack {
            Image("Astronaut")
                .resizable()
                .scaledToFill()
            Button("Explore More") {
                // Do something
            }
            .controlSize(.extraLarge)
            
            // 3D Model
            Model3D(named: "CosmonautSuit_en") { model in
                model
            } placeholder: {
                ProgressView()
            }

        }
    }
}

#Preview {
    ThreeDExperienceView()
}
