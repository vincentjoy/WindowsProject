//
//  SampleView.swift
//  WindowsProject
//
//  Created by Vincent Joy on 19/03/25.
//

import SwiftUI

struct SampleView: View {
    
    var color: Color
    var text: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(color)
            Text(text)
                .font(.extraLargeTitle)
        }
    }
}

#Preview {
    SampleView(color: .blue, text: "Hello")
}
