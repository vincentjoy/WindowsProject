//
//  ImmersiveView.swift
//  WindowsProject
//
//  Created by Vincent Joy on 19/03/25.
//

import SwiftUI
import RealityKit

struct ImmersiveView: View {
    
    var body: some View {
        RealityView { content in
            // Skybox entity
            let skyBoxEntity = createSkyBox()
            
            // Add to Reality View
            content.add(skyBoxEntity)
        }
    }
    
    private func createSkyBox() -> Entity {
        // Mesh
        let largeSphere = MeshResource.generateSphere(radius: 1000)
        
        // Material
        var skyBoxMaterial = UnlitMaterial()
        do {
            let texture = try TextureResource.load(named: "StarryNight")
            skyBoxMaterial.color = .init(texture: .init(texture))
        } catch {
            print("Error loading texture: \(error)")
        }
        
        // Entity
        let skyBoxEntity = Entity()
        skyBoxEntity.components.set(
            ModelComponent(
                mesh: largeSphere,
                materials: [skyBoxMaterial]
            )
        )
        
        // Map texture to inner surface of the sphere
        skyBoxEntity.scale *= .init(x: -1, y: 1, z: 1)
        
        return skyBoxEntity
    }
}

#Preview {
    ImmersiveView()
}
