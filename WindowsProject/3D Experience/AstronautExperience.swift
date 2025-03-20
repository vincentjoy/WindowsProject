//
//  AstronautExperience.swift
//  WindowsProject
//
//  Created by Vincent Joy on 20/03/25.
//

import SwiftUI
import RealityKit

struct AstronautExperience: View {
    var body: some View {
        RealityView { content in
            if let astronautEntity = try? await Entity(named: "CosmonautSuit_en") {
                
                // Change starting position
                astronautEntity.transform.translation = [0, -0.4, 0.3]
                
                // Start animation
                if let animation = astronautEntity.availableAnimations.first {
                    astronautEntity.playAnimation(animation)
                }
                
                content.add(astronautEntity)
            }
        }
    }
}

#Preview {
    AstronautExperience()
}
