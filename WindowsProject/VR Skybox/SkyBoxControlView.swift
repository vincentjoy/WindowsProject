//
//  SkyBoxControlView.swift
//  WindowsProject
//
//  Created by Vincent Joy on 01/04/25.
//

import SwiftUI

struct SkyBoxControlView: View {
    
    @EnvironmentObject var skyBoxSettings: SkyBoxsettings
    
    var body: some View {
        HStack {
            SkyBoxButtonView(onClick: {
                skyBoxSettings.currentSkyBox = .CityCentral
            }, iconName: "tree")
            
            SkyBoxButtonView(onClick: {
                skyBoxSettings.currentSkyBox = .CloudySky
            }, iconName: "moon")
            
            SkyBoxButtonView(onClick: {
                skyBoxSettings.currentSkyBox = .OfficeInterior
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


enum SkyBoxAssets: String {
    case CityCentral, CloudySky, OfficeInterior
}
