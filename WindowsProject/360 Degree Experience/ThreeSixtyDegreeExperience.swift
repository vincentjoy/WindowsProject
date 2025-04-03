//
//  ThreeSixtyDegreeExperience.swift
//  WindowsProject
//
//  Created by Vincent Joy on 03/04/25.
//

import SwiftUI
import RealityKit
import AVFoundation

struct ThreeSixtyDegreeExperience: View {
    var body: some View {
        RealityView { content in
            // Create a dynamic skybox
            guard let dynamicSkybox = createDynamicSkybox() else {
                return
            }
            
            // Add skybox to contact
            content.add(dynamicSkybox)
        }
    }
    
    private func createDynamicSkybox() -> Entity? {
        // Mesh
        let skyboxMesh = MeshResource.generateSphere(radius: 1000)
        
        // Video material
        guard let videoMaterial = createVideoMaterial() else {
            return nil
        }
        
        // Entity
        let skyboxEntity = ModelEntity(mesh: skyboxMesh, materials: [videoMaterial])
        
        // Map to inner surface
        skyboxEntity.scale *= .init(x: -1, y: 1, z: 1)
        
        return skyboxEntity
    }
    
    private func createVideoMaterial() -> VideoMaterial? {
        // Video url
        guard let url = Bundle.main.url(forResource: "tree", withExtension: "mp4") else {
            return nil
        }
        
        // AVPlayer
        let avPlayer = AVPlayer(url: url)
        
        // Video material
        let videoMaterial = VideoMaterial(avPlayer: avPlayer)
        avPlayer.play()
        
        return videoMaterial
    }
}

#Preview {
    ThreeSixtyDegreeExperience()
}
