//
//  CustomPressableButton.swift
//  mcstream
//
//  Created by Pranav on 12/10/25.
//

import SwiftUI

struct CustomPressableButton: View {
    // MARK: - Properties
    let title: String
    let offsetY: CGFloat
    let action: () -> Void
    
    // New customizable properties
    var buttonColor: Color = .blue
    var shadowColor: Color = .gray.opacity(0.7)
    var buttonHeight: CGFloat = 60
    var buttonWidth: CGFloat?
    var textColor: Color = .white
    
    @State private var isPressed = false
    private let cornerRadius: CGFloat = 16
    
    // MARK: - Body
    var body: some View {
        ZStack {
            // Shadow layer
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundStyle(shadowColor)
                .frame(height: buttonHeight)
                .frame(maxWidth: buttonWidth)
            
            // Main button layer
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundStyle(buttonColor)
                .frame(height: buttonHeight)
                .frame(maxWidth: buttonWidth)
            // Press animation
                .offset(y: isPressed ? 0 : -offsetY)
                .scaleEffect(isPressed ? 0.97 : 1.0)
                .overlay(
                    Text(title)
                        .foregroundColor(textColor)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
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
        .padding(.horizontal)
    }
}

// MARK: - Preview
struct CustomPressableButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 50) {
            CustomPressableButton(
                title: "Confirm",
                offsetY: 6,
                action: { print("Confirm tapped") },
                buttonColor: .green,
                shadowColor: .gray.opacity(0.6),
                buttonHeight: 60,
                buttonWidth: 200,
                textColor: .white
            )
            .padding()
            
            CustomPressableButton(
                title: "Go Back",
                offsetY: 6,
                action: { print("Go Back tapped") },
                buttonColor: .red,
                shadowColor: .gray.opacity(0.6),
                buttonHeight: 60,
                buttonWidth: 300,
                textColor: .white
            )
            .padding()
        }
        .padding()
    }
}
