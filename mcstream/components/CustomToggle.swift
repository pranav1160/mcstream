//
//  CuteToggle.swift
//  mcstream
//
//  Created by Pranav on 13/10/25.
//

import SwiftUI

struct CustomToggle: View {
    @Binding var isOn: Bool
    var onColor: Color = .pink
    var offColor: Color = .gray
    var icon: String = "heart.fill"
    
    var body: some View {
        ZStack {
            // Background capsule
            Capsule()
                .fill(isOn ? onColor : offColor.opacity(0.3))
                .frame(width: 60, height: 32)
                .shadow(color: isOn ? onColor.opacity(0.4) : Color.clear, radius: 8, x: 0, y: 4)
            
            // Sliding circle
            HStack {
                if isOn { Spacer() }
                
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 28, height: 28)
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                    
                    Image(systemName: icon)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(isOn ? onColor : offColor)
                        .scaleEffect(isOn ? 1.0 : 0.8)
                        .rotationEffect(.degrees(isOn ? 0 : -20))
                }
                
                if !isOn { Spacer() }
            }
            .padding(.horizontal, 2)
            .frame(width: 60)
        }
        .animation(.spring(response: 0.4, dampingFraction: 0.6), value: isOn)
        .onTapGesture {
            isOn.toggle()
        }
    }
}

#Preview {
    VStack {
        HStack {
            Text("Notifications")
                .font(.body)
            Spacer()
            CustomToggle(
                isOn: .constant(true),
                onColor: .pink,
                icon: "bell.fill"
            )
        }
        
        HStack {
            Text("Dark Mode")
                .font(.body)
            Spacer()
            CustomToggle(
                isOn: .constant(true),
                onColor: .purple,
                offColor: .orange,
                icon: "moon.stars.fill"
            )
        }
        
        HStack {
            Text("Vibration")
                .font(.body)
            Spacer()
            CustomToggle(
                isOn: .constant(true),
                onColor: .green,
                icon: "iphone.radiowaves.left.and.right"
            )
        }
    }.padding()
}
