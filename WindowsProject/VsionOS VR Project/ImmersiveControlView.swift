//
//  VRView.swift
//  WindowsProject
//
//  Created by Vincent Joy on 19/03/25.
//

import SwiftUI

struct ImmersiveControlView: View {
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        VStack {
            Button {
                Task {
                    await openImmersiveSpace(id: WindowID.immersiveView)
                }
            } label: {
                Image(systemName: "visionpro")
            }
        }
    }
}

#Preview {
    ImmersiveControlView()
}
