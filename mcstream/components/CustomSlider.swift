//
//  CustomSlider.swift
//  mcstream
//
//  Created by Pranav on 13/10/25.
//


import SwiftUI

struct CustomSlider: View {
    @Binding var value: Double
    var range: ClosedRange<Double> = 0...100
    var step: Double = 1
    var accentColor: Color = .blue
    var showLabel: Bool = true
    var suffix: String = ""
    var prefix: String = ""
    
    @State private var isDragging = false
    @GestureState private var dragOffset: CGFloat = 0
    
    private var normalizedValue: Double {
        (value - range.lowerBound) / (range.upperBound - range.lowerBound)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background track
                Capsule()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 6)
                
                // Progress track
                Capsule()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [accentColor, accentColor.opacity(0.7)]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: geometry.size.width * CGFloat(normalizedValue), height: 6)
                
                // Thumb
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: isDragging ? 32 : 28, height: isDragging ? 32 : 28)
                        .shadow(color: accentColor.opacity(0.3), radius: isDragging ? 8 : 4, x: 0, y: 2)
                    
                    Circle()
                        .fill(accentColor)
                        .frame(width: 12, height: 12)
                    
                    // Value label
                    if showLabel && isDragging {
                        VStack(spacing: 4) {
                            Text("\(prefix)\(Int(value))\(suffix)")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(
                                    Capsule()
                                        .fill(accentColor)
                                        .shadow(color: accentColor.opacity(0.4), radius: 8, x: 0, y: 4)
                                )
                            
                            Triangle()
                                .fill(accentColor)
                                .frame(width: 10, height: 6)
                        }
                        .offset(y: -50)
                        .transition(.scale.combined(with: .opacity))
                    }
                }
                .position(
                    x: geometry.size.width * CGFloat(normalizedValue),
                    y: 20
                )
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { gesture in
                            isDragging = true
                            let newValue = Double(gesture.location.x / geometry.size.width)
                            let clampedValue = min(max(newValue, 0), 1)
                            let scaledValue = clampedValue * (range.upperBound - range.lowerBound) + range.lowerBound
                            let steppedValue = (scaledValue / step).rounded() * step
                            value = min(max(steppedValue, range.lowerBound), range.upperBound)
                        }
                        .onEnded { _ in
                            isDragging = false
                        }
                )
            }
            .frame(height: 40)
        }
        .frame(height: 40)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isDragging)
    }
}

