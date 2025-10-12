//
//  CustomPressableIconButton.swift
//  mcstream
//
//  Created by Pranav on 12/10/25.
//

import SwiftUI

struct CustomIconButton: View {
    // MARK: - Properties
    let systemImage: String
    let offsetY: CGFloat
    let action: () -> Void
    
    // Customizable properties
    var buttonColor: Color = .blue
    var shadowColor: Color = .gray.opacity(0.7)
    var buttonSize: CGFloat = 60
    var iconColor: Color = .white
    var iconSize: CGFloat = 24
    
    @State private var isPressed = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            // Shadow layer
            Circle()
                .foregroundStyle(shadowColor)
                .frame(width: buttonSize, height: buttonSize)
            
            // Main button layer
            Circle()
                .foregroundStyle(buttonColor)
                .frame(width: buttonSize, height: buttonSize)
                .offset(y: isPressed ? 0 : -offsetY)
                .scaleEffect(isPressed ? 0.97 : 1.0)
                .overlay(
                    Image(systemName: systemImage)
                        .font(.system(size: iconSize, weight: .semibold))
                        .foregroundColor(iconColor)
                        .offset(y: isPressed ? 0 : -offsetY)
                        .scaleEffect(isPressed ? 0.8 : 1.0)
                )
                .onTapGesture {
                    withAnimation(.spring(response: 0.15, dampingFraction: 0.85)) {
                        isPressed = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(.spring(response: 0.15, dampingFraction: 0.85)) {
                            isPressed = false
                        }
                        action()
                    }
                }
        }
    }
}

// MARK: - Preview
struct CustomPressableIconButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 40) {
            CustomIconButton(
                systemImage: "heart.fill",
                offsetY: 6,
                action: { print("Heart tapped") },
                buttonColor: .pink,
                shadowColor: .gray.opacity(0.6),
                buttonSize: 70,
                iconColor: .white,
                iconSize: 28
            )
            
            CustomIconButton(
                systemImage: "arrow.left.circle.fill",
                offsetY: 6,
                action: { print("Back tapped") },
                buttonColor: .blue,
                shadowColor: .gray.opacity(0.6),
                buttonSize: 70,
                iconColor: .white,
                iconSize: 35
            )
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
