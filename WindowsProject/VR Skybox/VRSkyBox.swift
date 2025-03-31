//
//  VRSkyBox.swift
//  WindowsProject
//
//  Created by Vincent Joy on 29/03/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct VRSkyBox: View {
    
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        RealityView { content in
            // Create a sky box
            guard let skyBoxEntity = createSkyboxEntity() else { return }
            
            // Add to content
            content.add(skyBoxEntity)
        }
        .onAppear {
            openWindow(id: WindowID.skyBoxControls)
        }
    }
    
    private func createSkyboxEntity() -> Entity? {
        // Mesh (large sphere)
        let skyBoxMesh = MeshResource.generateSphere(radius: 1000)
        
        // Material (skybox image)
        var skyBoxMaterial = UnlitMaterial()
        guard let skyBoxTexture = try? TextureResource.load(named: "CityCentral") else { return nil }
        skyBoxMaterial.color = .init(texture: .init(skyBoxTexture))
        
        // Entity
        let skyBoxEntity = Entity()
        skyBoxEntity.components.set(
            ModelComponent(mesh: skyBoxMesh, materials: [skyBoxMaterial])
        )
        
        // Map image to inner surface of sphere
        skyBoxEntity.scale = .init(x: -1, y: 1, z: 1)
        
        return skyBoxEntity
    }
}

#Preview {
    VRSkyBox()
}
