//
//  NoBlinkButtonStyle.swift
//  SwiftUICustomSlider
//
//  Created by Tilak Shakya on 27/07/24.
//

import SwiftUI

struct NoBlinkButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.0 : 1.0) // No scale change
            .opacity(configuration.isPressed ? 1.0 : 1.0) // No opacity change
    }
}

