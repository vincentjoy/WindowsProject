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
    @EnvironmentObject var skyBoxSettings: SkyBoxsettings
    
    var body: some View {
        RealityView { content in
            // Create a sky box
            guard let skyBoxEntity = createSkyboxEntity() else { return }
            
            // Add to content
            content.add(skyBoxEntity)
        } update: { content in
            updateSkyBox(with: skyBoxSettings.currentSkyBox, content: content)
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
        skyBoxEntity.name = "SkyBox"
        
        // Map image to inner surface of sphere
        skyBoxEntity.scale = .init(x: -1, y: 1, z: 1)
        
        return skyBoxEntity
    }
    
    private func updateSkyBox(with newSkyBoxName: SkyBoxAssets, content: RealityViewContent) {
        // Get skybox entity from content
        let skyBoxEntity = content.entities.first { entity in
            entity.name == "SkyBox"
        }
        
        // Update its material to latest sky box
        guard let updatedSkyBoxTexture = try? TextureResource.load(named: newSkyBoxName.rawValue) else { return }
        var updatedSkyBoxMaterial = UnlitMaterial()
        updatedSkyBoxMaterial.color = .init(texture: .init(updatedSkyBoxTexture))
        
        // Set component
        let meshResource = MeshResource.generateSphere(radius: 1000)
        skyBoxEntity?.components.set(
            ModelComponent(mesh: meshResource, materials: [updatedSkyBoxMaterial])
        )
    }
}

#Preview {
    VRSkyBox()
}

class SkyBoxsettings: ObservableObject {
    @Published var currentSkyBox: SkyBoxAssets = .CityCentral
}
