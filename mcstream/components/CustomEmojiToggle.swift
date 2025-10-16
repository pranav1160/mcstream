//
//  CustomEmojiToggle.swift
//  mcstream
//
//  Created by Pranav on 13/10/25.
//

import SwiftUI

struct CustomEmojiToggle: View {
    @Binding var isOn: Bool
    var onEmoji: String = "😊"
    var offEmoji: String = "😴"
    var onColor: Color = .yellow
    var offColor: Color = .indigo
    
    var body: some View {
        ZStack {
            Capsule()
                .fill(isOn ? onColor.opacity(0.3) : offColor.opacity(0.3))
                .frame(width: 70, height: 38)
                .overlay(
                    Capsule()
                        .strokeBorder(isOn ? onColor : offColor, lineWidth: 2)
                )
            
            HStack {
                if isOn { Spacer() }
                
                ZStack {
                    Circle()
                        .fill(isOn ? onColor : offColor)
                        .frame(width: 32, height: 32)
                    
                    Text(isOn ? onEmoji : offEmoji)
                        .font(.system(size: 18))
                        .scaleEffect(isOn ? 1.1 : 1.0)
                        .rotationEffect(.degrees(isOn ? 360 : 0))
                }
                
                if !isOn { Spacer() }
            }
            .padding(.horizontal, 3)
            .frame(width: 70)
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.7), value: isOn)
        .onTapGesture {
            isOn.toggle()
        }
    }
}

#Preview {
    VStack {
        HStack {
            Text("Sleep Mode")
                .font(.body)
            Spacer()
            CustomEmojiToggle(isOn: .constant(true),
                        onEmoji: "😊",
                        offEmoji: "😴")
         
        }

    }.padding()
}
