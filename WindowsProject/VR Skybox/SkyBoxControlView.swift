//
//  SkyBoxControlView.swift
//  WindowsProject
//
//  Created by Vincent Joy on 01/04/25.
//

import SwiftUI

struct SkyBoxControlView: View {
    var body: some View {
        HStack {
            SkyBoxButtonView(onClick: {
                
            }, iconName: "tree")
            
            SkyBoxButtonView(onClick: {
                
            }, iconName: "moon")
            
            SkyBoxButtonView(onClick: {
                
            }, iconName: "sun.min")
        }
    }
}

#Preview {
    SkyBoxControlView()
}

struct SkyBoxButtonView: View {
    
    var onClick: () -> Void
    var iconName: String
    
    var body: some View {
        Button(action: {
            // Change skybox
            onClick()
        }, label: {
            Image(systemName: iconName)
        })
    }
}
