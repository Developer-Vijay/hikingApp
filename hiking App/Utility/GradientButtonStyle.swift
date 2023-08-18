//
//  GradientButtonStyle.swift
//  hiking App
//
//  Created by Vijay Sahoo on 15/08/23.
//

import Foundation
import SwiftUI

struct GradientButton:ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal,30)
            .background(
                // Conditional Statement with Nil Coalescing
                // Condition ? A : B
                configuration.isPressed ?   LinearGradient(colors: [
                    .customGrayMedium,
                    .customGrayLight],
                               startPoint: .top,
                               endPoint: .bottom) :
                // A : when useer presses the button
                // B: When the button is not Pressed
                LinearGradient(colors: [
                    .customGrayLight,
                    .customGrayMedium],
                               startPoint: .top,
                               endPoint: .bottom)
            )
            .cornerRadius(40)
            
    }
}
