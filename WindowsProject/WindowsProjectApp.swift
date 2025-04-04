//
//  WindowsProjectApp.swift
//  WindowsProject
//
//  Created by Vincent Joy on 19/03/25.
//

import SwiftUI

@main
struct WindowsProjectApp: App {
    
    @ObservedObject var skyboxSettings = SkyBoxsettings()
    @State var immersionMode: ImmersionStyle = .full
    
    var body: some Scene {
        
        // MARK: - Window group project
        /*
        WindowGroup(id: WindowID.windowMain) {
            StartingView()
        }
        .defaultSize(width: 600, height: 450)
        
        WindowGroup(id: WindowID.window1) {
            SampleView(color: .blue, text: WindowID.window1)
        }
        
        WindowGroup(id: WindowID.window2) {
            SampleView(color: .orange, text: WindowID.window1)
        }
        */
        
        
        // MARK: - Vision OS VR project
        /*
        // Starting window
        WindowGroup() {
            ImmersiveControlView()
        }
        .defaultSize(width: 10, height: 10)
        .windowStyle(.plain)
        
        // VR
        ImmersiveSpace(id: WindowID.immersiveView) {
            ImmersiveView()
        }
        .immersionStyle(selection: $immersionMode, in: .full)
         */
        
        
        // MARK: - 3D Experience
        /*
        WindowGroup(id: "Window") {
            ThreeDExperienceView()
        }
        
        WindowGroup(id: "Volume") {
            AstronautExperience()
        }
        .windowStyle(.volumetric)
        */
        
        
        // MARK: - VR SkyBox
        /*
        ImmersiveSpace(id: WindowID.vrSkyBox) {
            VRSkyBox()
                .environmentObject(skyboxSettings)
        }
        .immersionStyle(selection: .constant(.full), in: .full)
        
        WindowGroup(id: WindowID.skyBoxControls) {
            SkyBoxControlView()
                .environmentObject(skyboxSettings)
        }
        .defaultSize(width: 30, height: 30)
         */
        
        // MARK:- 360 Degree Experience
        ImmersiveSpace(id: WindowID.threeSixty) {
            ThreeSixtyDegreeExperience()
        }
    }
}

struct WindowID {
    static let windowMain = "Window 0"
    static let window1 = "Window 1"
    static let window2 = "Window 2"
    static let immersiveView = "Immersive View"
    static let vrSkyBox = "VR Sky Box"
    static let skyBoxControls = "SkyBox Controls"
    static let threeSixty = "Three Sixty Degree Experience"
}
